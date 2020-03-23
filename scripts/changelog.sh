#!/usr/bin/env

GITHUB_REPOSITORY=$(git remote get-url origin | awk '-F[/:.]' '{print $(NF-2) "/" $(NF-1)}')
PR_NUM=${PR_NUM:-$1}

if [[ -z "${PR_NUM}" ]]; then
  PR_NUM=$(
  curl -s "https://api.github.com/graphql" \
    -X POST \
    -H "Authorization: bearer $GITHUB_TOKEN" \
    -d "{\"query\": $(jq -aRs <<END
query {
  search(first: 10, query: "$(git rev-parse HEAD)", type: ISSUE) {
    nodes {
      ... on PullRequest {
        number
      }
    }
  }
}
END
)}" | jq -r '.data.search.nodes[0].number')

  if [[ $PR_NUM -eq null ]]; then
    exit
  fi
fi

curl -s "https://api.github.com/graphql" \
  -X POST \
  -H "Authorization: bearer $GITHUB_TOKEN" \
  -d "{\"query\": $(jq -aRs <<END
query {
  repository(owner: "$(dirname ${GITHUB_REPOSITORY})", name: "$(basename ${GITHUB_REPOSITORY})") {
    pullRequest(number: ${PR_NUM}) {
      commits(first: 250) {
        nodes {
          commit {
            oid
            associatedPullRequests(first: 1) {
              nodes {
                author {
                  ... on User {
                    login
                  }
                }
                number
                title
              }
            }
          }
        }
      }
    }
  }
}
END
)}" |
  jq '.data.repository.pullRequest.commits.nodes[].commit.associatedPullRequests.nodes[0]' |
  jq -r '"- #" + (.number | tostring) + " " + .title + " @" + .author.login' |
  sort | uniq
