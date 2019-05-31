node('docker') {

    stage 'Checkout'
        checkout scm
    stage 'Build image'
        sh "docker build -t greentube_jenkins-master-server:Build${BUILD_NUMBER} -f jenkins-server/Dockerfile ."
}
