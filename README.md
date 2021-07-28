# ExoRepo

ExoRepo provides syntactic sugar for Pharo's Iceberg to support repositories beyond GitLab, GitHub and 
Bitbucket.

## Installation

### from Gitea 

Run from a playground:

```smalltalk
  location := FileLocator localDirectory / 'iceberg' / 'Offray' / 'ExoRepo'.
  (IceRepositoryCreator new 
      location: location;
      remote: (IceGitRemote url: 'https://code.tupale.co/Offray/ExoRepo.git');
      createRepository)
  register.

  Metacello new
      repository: 'gitlocal://', location fullName;
      baseline: 'ExoRepo';
      load
```

### from GitHub

Run from a playground:

```smalltalk
Metacello new
 repository: 'github://offray/ExoRepo/';
 baseline: 'ExoRepo';
 load.
 ```

 ## Usage

 To install the repository <https://code.tupale.co/Offray/TiddlyWikiPharo> run:

 ```smalltalk
 ExoRepo new
    repository: 'https://code.tupale.co/Offray/TiddlyWikiPharo';
    load.
 ```