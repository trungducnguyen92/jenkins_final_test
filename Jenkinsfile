pipeline {
    agent none
    parameters {
        choice(
            choices: ['nodejs' , 'python', 'all'],
            description: '',
            name: 'REQUESTED_ACTION')
    }

    stages {
        
        stage ('build-nodejs') {
            agent {label 'master'}
            when {
                // Only say hello if a "greeting" is requested
                expression { params.REQUESTED_ACTION == 'nodejs' }
            }
            steps {
                echo "Building app nodejs!"
                sh '''
                cd /tmp/jenkins
                ./test.sh
                '''
            }
        }
		
		stage ('push-nodejs') {
		    agent {label 'master'}
            when {
				// Only say hello if a "greeting" is requested
                expression { params.REQUESTED_ACTION == 'nodejs' }
            }
            steps {
                echo "Pushing nodejs container image!"
                sh '''
                cd /tmp/jenkins
                ./test.sh
                '''
            }
        }
		
		stage ('deploy-nodejs') {
		    agent {label 'jenkin_2'}
            when {
                // Only say hello if a "greeting" is requested
                expression { params.REQUESTED_ACTION == 'nodejs' }
            }
            steps {
                echo "Deploy nodejs container image!"
                sh '''
                cd /tmp/
                ./test.sh
                '''
            }
        }
		
        stage ('build-python') {
            agent {label 'master'}
            when {
                // Only say hello if a "greeting" is requested
                expression { params.REQUESTED_ACTION == 'python' }
            }
            steps {
                echo "Building app python!"
                sh '''
                cd /tmp/jenkins
                ./test.sh
                '''
            }
        }
		
		stage ('push-python') {
		    agent {label 'master'}
            when {
				// Only say hello if a "greeting" is requested
                expression { params.REQUESTED_ACTION == 'python' }
            }
            steps {
                echo "Pushing python container image!"
                sh '''
                cd /tmp/jenkins
                ./test.sh
                '''
            }
        }
		
		stage ('deploy-python') {
		    agent {label 'jenkin_2'}
            when {
                // Only say hello if a "greeting" is requested
                expression { params.REQUESTED_ACTION == 'python' }
            }
            steps {
                echo "Deploy python container image!"
                sh '''
                cd /tmp/
                ./test.sh
                '''
            }
        }
		
        stage ('all') {
            agent {label 'master'}
            when {
                // Only say hello if a "greeting" is requested
                expression { params.REQUESTED_ACTION == 'all' }
            }
            steps {
                echo "Building app all!"
                sh '''
                cd /tmp/jenkins
                ./test.sh
                '''
            }
        }
		
		stage ('push-all') {
		    agent {label 'master'}
            when {
				// Only say hello if a "greeting" is requested
                expression { params.REQUESTED_ACTION == 'all' }
            }
            steps {
                echo "Pushing all container image!"
                sh '''
                cd /tmp/jenkins
                ./test.sh
                '''
            }
        }
		
		stage ('deploy-all') {
		    agent {label 'jenkin_2'}
            when {
                // Only say hello if a "greeting" is requested
                expression { params.REQUESTED_ACTION == 'all' }
            }
            steps {
                echo "Deploy all container image!"
                sh '''
                cd /tmp/
                ./test.sh
                '''
            }
        }
    }
}
