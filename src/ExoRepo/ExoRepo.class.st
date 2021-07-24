Class {
	#name : #ExoRepo,
	#superclass : #Object,
	#instVars : [
		'url'
	],
	#category : #ExoRepo
}

{ #category : #accessing }
ExoRepo >> load [
	"I load the configuration of this package using a external Gitea repository." 
	"While more Git independient providers are implemented in Monticello, I will 
	use Iceberg to download the repository and load it from a local directory"	
	| location localRepo repoName packageName |
	
	"Sometimes repoName and packageName are different, following Pharo's conventions.
	For example the repoName can be MyPackage, while packageName can be My-Package"
	repoName := self repositoryName.
	
	"Local and remote repo definition"
	location := FileLocator localDirectory / 'iceberg' / (self provider) / repoName.
	location exists ifFalse: [
		(IceRepositoryCreator new 
			location: location;
			remote: (IceGitRemote url: self url asString, '.git');
			createRepository)
		register
	].
	"Package loading"
	localRepo := 'gitlocal://', location fullName.
	Metacello new
		repository: localRepo;
		baseline: repoName;
		load.
]

{ #category : #accessing }
ExoRepo >> provider [
	self url ifNil: [ ^ nil ].
	^ self url segments first
]

{ #category : #accessing }
ExoRepo >> repositoryName [
	self url ifNil: [ ^ self ].
	^ self url segments last
]

{ #category : #accessing }
ExoRepo >> url [
	^ url.
]

{ #category : #accessing }
ExoRepo >> url: aString [
	url := aString asZnUrl
]
