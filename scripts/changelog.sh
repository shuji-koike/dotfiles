GITHUB_REPOSITORY=$(git remote get-url origin | awk '-F[/:.]' '{print $(NF-2) "/" $(NF-1)}')
PR_NUM=${PR_NUM:-$1}

if [[ -z "${PR_NUM}" ]]; then
  #TODO
  curl "https://api.github.com/repos/$(dirname ${GITHUB_REPOSITORY})/$(basename ${GITHUB_REPOSITORY})/git/commits/$(git rev-parse HEAD)"
  curl -H "Accept: application/vnd.github.cloak-preview" \
    "https://api.github.com/search/commits?q=hash:$(git rev-parse HEAD)%20repo:${GITHUB_REPOSITORY}"
  exit
fi

curl -s \
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
)}" https://api.github.com/graphql |
  jq '.data.repository.pullRequest.commits.nodes[].commit.associatedPullRequests.nodes[0]' |
  jq -r '"- #" + (.number | tostring) + " " + .title + " @" + .author.login' |
  sort | uniq
