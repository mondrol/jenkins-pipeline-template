node('docker-slave') {
    
    ansiColor('xterm') {
        timestamps {
            stage('Build Image') {
                checkout scm
                sh """
                   make image tag 
                """
            }

            stage('Push Image') {
                withDockerRegistry([credentialsId: 'dockerhub', url: 'https://index.docker.io/v1/']) {
                    sh """
                      make push 
                    """
                }
            }
        }
    }
}
