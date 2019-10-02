object nfsBackup: TnfsBackup
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = 'nfsBackup'
  BeforeInstall = ServiceBeforeInstall
  AfterInstall = ServiceAfterInstall
  BeforeUninstall = ServiceBeforeUninstall
  AfterUninstall = ServiceAfterUninstall
  OnContinue = ServiceContinue
  OnExecute = ServiceExecute
  OnPause = ServicePause
  OnShutdown = ServiceShutdown
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 150
  Width = 215
end
