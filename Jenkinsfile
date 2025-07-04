pipeline {
  agent any

  environment {
    ANSIBLE_HOST_KEY_CHECKING = 'False'
  }

  stages {
    stage('Checkout Code') {
      steps {
        git branch: 'main', url: 'https://github.com/sripriya7-ande/terraform2.git'
      }
    }

    stage('Terraform Init and Apply') {
      steps {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: 'aws-credentials-id'
        ]]) {
          sh '''
            export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
            export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

            terraform init
            terraform apply -auto-approve
          '''
        }
      }
    }

    stage('Run Ansible') {
      steps {
        withCredentials([file(credentialsId: 'jenkins-key', variable: 'KEY_FILE')]) {
          sh '''
            chmod 400 $KEY_FILE
            ansible-playbook -i hosts playbook.yml --private-key=$KEY_FILE
          '''
        }
      }
    }
  }

  post {
    success {
      echo 'Deployment completed successfully!'
    }
    failure {
      echo 'Pipeline failed!'
    }
  }
}
