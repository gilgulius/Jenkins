pipeline {
    agent any

    parameters {
        string(name: 'MESSAGE', defaultValue: 'Hello from Jenkins!', description: 'Custom message for the report')
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/gilgulius/jenkins.git'
            }
        }

        stage('Run PowerShell Script') {
            steps {
                powershell "powershell -ExecutionPolicy Bypass -File script.ps1 -Message '${params.MESSAGE}'"
            }
        }

        stage('Publish HTML Report') {
            steps {
                publishHTML (target: [
                    allowMissing: false,
                    alwaysLinkToLastBuild: true,
                    keepAll: true,
                    reportDir: '.',
                    reportFiles: 'output.html',
                    reportName: 'Jenkins Job Output'
                ])
            }
        }
        
    }
}
    

