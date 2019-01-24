alias k8=kubectl
alias pods-all='kubectl get pods'
alias pods-images="kubectl get pods -o json | jq -r '.items[].spec.containers[].image' | sort | uniq -c"
alias pods='pods-all && pods-images'
