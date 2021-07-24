Class {
	#name : #BaselineOfExoRepo,
	#superclass : #BaselineOf,
	#category : #BaselineOfExoRepo
}

{ #category : #baselines }
BaselineOfExoRepo >> baseline: spec [ 
	<baseline>
	
	spec 
		for: #common  
		do: [  
			spec package: 'ExoRepo'
		] 
]

{ #category : #accessing }
BaselineOfExoRepo >> projectClass [
	^ MetacelloCypressBaselineProject 
]
