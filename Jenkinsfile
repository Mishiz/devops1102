pipeline {
    agent {
       docker {
         image 'mishiz/devops1102-build'
       }
    }

    stages {

      stage('Copy source boxfuse') {
        steps {
           git 'https://github.com/Mishiz/devops11.git'
        }
      }

      stage('Make WAR file') {
        steps {
         sh 'mvn package'
        }
      }

      stage('Make docker image') {
        steps {
          git 'https://github.com/Mishiz/devops1102.git'
          sh 'cp ./target/hello-1.0.war ./app/ROOT.war && cd ./devops1102/app/ && docker build --tag=devops1102-app .'
          sh '''docker tag devops1102-app mishiz/devops1102-app && docker push mishiz/devops1102-app'''

        }
      }

      stage(' Run docker on prod ') {
        steps {
        sh 'ssh-keyscan -H 10.114.0.3 >> ~/.ssh/known_hosts'
        sh '''ssh root@10.114.0.3 << EOF
        docker pull mishiz/devops1102-app
        docker run -d -p 8080:8080 mishiz/devops1102-app
        EOF'''
        }
      }


    }
}