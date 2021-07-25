# ExoRepo

ExoRepo provides syntactic sugar for Pharo's Iceberg to support repositories beyond GitLab, GitHub and 
Bitbucket.

To install this from Gitea, run from a playground:

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