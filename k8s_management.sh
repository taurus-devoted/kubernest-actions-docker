#!/bin/bash

function deploy() {
  kubectl apply -f deployment.yml
  kubectl apply -f service.yml
  echo "Deployment and Service applied successfully."
}
function rollback() {
  kubectl rollout undo deployment/my-deployment
  echo "Rollback completed."
}

function check_status() {
  kubectl get pods --watch
}
function main() {
  case "$1" in
    deploy)
      deploy
      ;;
    rollback)
      rollback
      ;;
    status)
      check_status
      ;;
    *)
      echo "Usage: $0 {deploy|rollback|status}"
      exit 1
  esac
}

main "$@"
