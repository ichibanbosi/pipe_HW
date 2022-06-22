pipeline {
    agent {
        docker {
            image 'ivangelion/final_pipe'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    stages {
        stage ('git') {
            steps {
            git branch: 'main', url: 'https://github.com/ichibanbosi/docker_maven_tomcat.git'
            //cd ./docker_maven_tomcat
            sh 'pwd'
            }
        }

        stage ('docker') {
            steps {
            sh 'docker login --username  --password '
            sh 'docker build -t hw_pipe .'
            sh 'docker tag hw_pipe ivangelion/hw_pipe'
            sh 'docker push ivangelion/hw_pipe'
            }
        }

        stage ('docker_run') {
            steps {
            sh 'ssh-keyscan -H 192.168.42.136 >> ~/.ssh/known_hosts'
            sh 'ssh 192.168.42.136 "docker run -d -p 4444:8080 ivangelion/hw_pipe"'
            }
        }
    }
}