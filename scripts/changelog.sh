curl \
  -X POST \
  -H "Authorization: bearer $GITHUB_TOKEN" \
  -d "{\"query\": $(jq -aRs <<END
query {
  repository(owner: "mvrck-inc", name: "cirqua") {
    pullRequest(number: $PR) {
      commits(first: 250) {
        nodes {
          commit {
            oid
            associatedPullRequests(first: 1) {
              nodes {
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
)}" \
  https://api.github.com/graphql |
  jq '.data.repository.pullRequest.commits.nodes[].commit.associatedPullRequests.nodes[0]' |
  jq -r '"#" + (.number | tostring) + " " + .title' |
  sort | uniq
