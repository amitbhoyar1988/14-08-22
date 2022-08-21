pipeline {
    agent any

    stages {
        stage('Fetch the Code in GIT') {
            steps {
                git branch: 'main', url: 'https://github.com/amitbhoyar1988/14-08-22.git'
            }
        }
         stage('Build') {
            steps {
                sh 'docker build -t abhoyar9/21-08-2022:$BUILD_NUMBER .'
                 sh 'docker build -t abhoyar9/21-08-2022:latest .'
            }
        }
        stage('Docker-login') {
            steps {
                withCredentials([usernameColonPassword(credentialsId: 'Dockerlogin', variable: 'amit')]) {
    // some block
}
            }
        }
        stage('Push Image in Dockerhub') {
            steps {
                sh 'docker push abhoyar9/21-08-2022:$BUILD_NUMBER'
                sh 'docker push abhoyar9/21-08-2022:latest'
            }
        }
          stage('To run the image on Deploy server') {
            steps {
                sshPublisher(publishers: [sshPublisherDesc(configName: 'Deploy-server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'sudo sh /root/amit/1.sh', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
    }
}
