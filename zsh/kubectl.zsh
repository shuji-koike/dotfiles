alias k8=kubectl
alias pods-all='kubectl get pods --all-namespaces'
alias pods-images="kubectl get pods --all-namespaces -o json | jq -r '.items[].spec.containers[].image' | sort | uniq -c"
alias pods='pods-all && pods-images'
