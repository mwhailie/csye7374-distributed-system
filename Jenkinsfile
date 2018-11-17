podTemplate(label: 'mypod', containers: [
    containerTemplate(name: 'docker', image: 'docker', ttyEnabled: true, command: 'cat'),
    containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.0', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'helm', image: 'lachlanevenson/k8s-helm:latest', command: 'cat', ttyEnabled: true)
  ],
  volumes: [
    hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
  ]) {
    node('mypod') {
        def docker_repository
        stage('Build Docker Image') {
            container('docker') {
                    withCredentials([[$class: 'UsernamePasswordMultiBinding', 
                            credentialsId: 'dockerhub',
                            usernameVariable: 'DOCKER_HUB_USER', 
                            passwordVariable: 'DOCKER_HUB_PASSWORD']]) {
                    git credentialsId: 'git', url: 'https://github.com/mwhailie/csye7374-fall2018.git'
                    docker_repository = "${env.DOCKER_HUB_USER}/csye7374"
                    sh "docker build ./webapp -t ${env.DOCKER_HUB_USER}/csye7374:${env.BUILD_NUMBER} "
                    sh "docker login -u ${env.DOCKER_HUB_USER} -p ${env.DOCKER_HUB_PASSWORD} "
                    sh "docker push ${env.DOCKER_HUB_USER}/csye7374:${env.BUILD_NUMBER} "
                }
            }
        }
        stage('Update Kubernetes') {
            container('kubectl') {
                sh "kubectl rolling-update csye7374-app-rc --image ${docker_repository}:${env.BUILD_NUMBER}"
            }
        }
    }
  }