pipeline {
    agent {
       docker {
         image 'mishiz/devops1102-build'
         args '-v /var/run/docker.sock:/var/run/docker.sock'

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
          sh 'cp ./target/hello-1.0.war ./app/ROOT.war && cd ./app && docker build --tag=devops1102-app .'
          sh 'docker tag devops1102-app mishiz/devops1102-app'

          withDockerRegistry(credentialsId: '3201def3-fc62-4ba0-a60e-a8acb8c7cc0a', url: '')  {
          sh 'docker push mishiz/devops1102-app'
          }


        }
      }

      stage(' Run docker on prod ') {
        steps {
        sh 'ssh-keyscan -H 10.114.0.3 >> /root/.ssh/known_hosts'
        sh '''ssh jenkins@10.114.0.3 << EOF
        sudo docker pull mishiz/devops1102-app
        sudo docker run -d -p 8080:8080 mishiz/devops1102-app
        EOF'''
        }
      }


    }
}