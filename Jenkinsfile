node('docker') {
 
    stage 'Checkout'
        checkout scm
    stage 'Build & UnitTest'
        sh "docker build -t greentube:B${BUILD_NUMBER} -f Dockerfile ."
}
