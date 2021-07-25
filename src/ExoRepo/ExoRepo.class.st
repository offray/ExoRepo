Class {
	#name : #ExoRepo,
	#superclass : #Object,
	#instVars : [
		'repository'
	],
	#category : #ExoRepo
}

{ #category : #accessing }
ExoRepo >> load [
	"I load the configuration of this package using a external Gitea repository."
	"While more Git independient providers are implemented in Monticello, I will 
	use Iceberg to download the repository and load it from a local directory"
	| location localRepo repoName  |
	
	"Sometimes repoName and packageName are different, following Pharo's conventions.
	For example the repoName can be MyPackage, while packageName can be My-Package"
	repoName := self repositoryName.
	"Local and remote repo definition"
	location := FileLocator localDirectory / 'iceberg' / (self provider) / repoName.
	location exists ifFalse: [
		(IceRepositoryCreator new
			location: location;
			remote: (IceGitRemote url: self repository asString, '.git');
			createRepository)
		register
	].
	"Package loading"
	localRepo := 'gitlocal://', location fullName.
	^ Metacello new
		repository: localRepo;
		baseline: repoName;
		load.
]

{ #category : #accessing }
ExoRepo >> provider [
	self repository ifNil: [ ^ nil ].
	^ self repository segments first
]

{ #category : #accessing }
ExoRepo >> repository [
	^ repository.
]

{ #category : #accessing }
ExoRepo >> repository: aString [
	repository := aString asZnUrl
]

{ #category : #accessing }
ExoRepo >> repositoryName [
	self repository ifNil: [ ^ self ].
	^ self repository segments last
]
