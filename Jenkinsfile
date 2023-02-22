pipeline {
    agent any
    triggers { cron 'H 12 * * 1-5' }
    tools { nodejs "19.5.0" }
    parameters {
        choice choices: ['chromium', 'firefox', 'webkit', 'AllBrowsers'], 
                        description: 'Choose browser(s) for test execution:', name: 'BrowserChoice'
    }
    stages {
        stage('install playwright') {
            steps {
                sh "npm install"
            }
        }
        stage('test') {
            steps {
                script {
                    if (params.BrowserChoice == 'AllBrowsers') {
                        sh "npm run test"
                    } else {
                        sh "npm run test -- --project=${params.BrowserChoice}"
                    }
                }
            }
        }
    }
    post {
        always {
            script {
                allure([includeProperties: false,
                        jdk: '',
                        properties: [],
                        reportBuildPolicy: 'ALWAYS',
                        results: [[path: 'allure-results']]
                ])
                cleanWs()
            }
            mail bcc: '', body: 'Test mail', cc: '', from: '', replyTo: '', subject: 'Test', to: 'alexandr_jdanov@yahoo.com'
        }       
    }
}  