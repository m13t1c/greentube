node('docker') {
 
    stage 'Checkout'
        checkout scm
    stage 'Build image'
        sh "docker build -t greentube-jenkins-master:Build${BUILD_NUMBER} -f jenkins-server/Dockerfile ."
}
