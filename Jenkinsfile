pipeline {
    
    agent any


    stages {
        stage('Get prject from GIT') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'master', url: 'https://github.com/MEZNInidhal/devopssr.git'
            }

            post {
                success {
                    echo 'Récupération done'
                }
            }
        }
        
        stage('Maven Clean') {
            steps {
                sh 'mvn clean'
            }

            post {
                failure {
                      // Send email regardless of build result
                  emailext body: "${currentBuild.currentResult}", // Use ${currentBuild.currentResult} to get the build result
               subject: "Jenkins Build ${currentBuild.currentResult}: ${env.JOB_NAME} - Build #${env.BUILD_NUMBER}",
               to: "mezni.nidhal@esprit.tn",
               from: "mezni.nidhal@esprit.tn"
            }
          }
        }

        stage('Maven Compile'){
            steps {
                sh 'mvn compile -DskipTests'
            }
            post {
                failure {
                      // Send email regardless of build result
                  emailext body: "${currentBuild.currentResult}", // Use ${currentBuild.currentResult} to get the build result
               subject: "Jenkins Build ${currentBuild.currentResult}: ${env.JOB_NAME} - Build #${env.BUILD_NUMBER}",
               to: "mezni.nidhal@esprit.tn",
               from: "mezni.nidhal@esprit.tn"
            }
          }
        }
        
        stage('Les tests unitaires') {
            steps {
                sh 'mvn test'
            }
            post {
                failure {
                      // Send email regardless of build result
                  emailext body: "${currentBuild.currentResult}", // Use ${currentBuild.currentResult} to get the build result
               subject: "Jenkins Build ${currentBuild.currentResult}: ${env.JOB_NAME} - Build #${env.BUILD_NUMBER}",
               to: "mezni.nidhal@esprit.tn",
               from: "mezni.nidhal@esprit.tn"
            }
          }
        }
        
        stage('SonarQube Tests') {
            steps {
                sh 'mvn sonar:sonar -Dsonar.login=admin -Dsonar.password=sonar'
            }
            post {
                failure {
                      // Send email regardless of build result
                  emailext body: "${currentBuild.currentResult}", // Use ${currentBuild.currentResult} to get the build result
               subject: "Jenkins Build ${currentBuild.currentResult}: ${env.JOB_NAME} - Build #${env.BUILD_NUMBER}",
               to: "mezni.nidhal@esprit.tn",
               from: "mezni.nidhal@esprit.tn"
            }
          }
        }
        
        stage('Déposer le livrable sur Nexus') {
            steps {
                sh 'mvn package -DskipTests'
                sh 'mvn deploy -DskipTests'
            }
            post {
                failure {
                      // Send email regardless of build result
                  emailext body: "${currentBuild.currentResult}", // Use ${currentBuild.currentResult} to get the build result
               subject: "Jenkins Build ${currentBuild.currentResult}: ${env.JOB_NAME} - Build #${env.BUILD_NUMBER}",
               to: "mezni.nidhal@esprit.tn",
               from: "mezni.nidhal@esprit.tn"
            }
          }
        }
        
        stage('Build de l’image (partie spring)') {
            steps {
                sh 'docker build -t nidhalm/achat:latest .'
            }
            post {
                failure {
                      // Send email regardless of build result
                  emailext body: "${currentBuild.currentResult}", // Use ${currentBuild.currentResult} to get the build result
               subject: "Jenkins Build ${currentBuild.currentResult}: ${env.JOB_NAME} - Build #${env.BUILD_NUMBER}",
               to: "mezni.nidhal@esprit.tn",
               from: "mezni.nidhal@esprit.tn"
            }
          }
        }
        
        stage('Déposer l\'image créée sur DockerHub') {
            steps {
                sh 'docker login -u "nidhalm" -p "211JMT1886" docker.io'
                sh 'docker push nidhalm/:latest'
            }
            post {
                failure {
                      // Send email regardless of build result
                  emailext body: "${currentBuild.currentResult}", // Use ${currentBuild.currentResult} to get the build result
               subject: "Jenkins Build ${currentBuild.currentResult}: ${env.JOB_NAME} - Build #${env.BUILD_NUMBER}",
               to: "mezni.nidhal@esprit.tn",
               from: "mezni.nidhal@esprit.tn"
            }
          }
        }
        
        stage('Lancer simultanément les images avec docker-compose') {
            steps {
                sh 'git checkout nidhal-Mezni'
                git branch: 'nidhal-Mezni', url: 'https://github.com/MEZNInidhal/devopssr.git'
                sh 'docker-compose up -d'
            }
            post {
                failure {
                      // Send email regardless of build result
                  emailext body: "${currentBuild.currentResult}", // Use ${currentBuild.currentResult} to get the build result
               subject: "Jenkins Build ${currentBuild.currentResult}: ${env.JOB_NAME} - Build #${env.BUILD_NUMBER}",
               to: "mezni.nidhal@esprit.tn",
               from: "mezni.nidhal@esprit.tn"
            }
          }
        }
    }
}
