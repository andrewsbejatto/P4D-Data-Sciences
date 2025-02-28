(********************************************************
 * Part of Python for Delphi - Data Sciences libraries  *
 *                                                      *
 * Copyright (c) 2022 by Embarcadero Technologies       *
 * Licensed under the MIT License                       *
 *                                                      *
 * For full license text and more information visit:    *
 * https://github.com/Embarcadero/P4D-Data-Sciences     *
 ********************************************************)


unit WxPython;

interface

uses
  System.Classes, PyPackage, PyPackage.Model, PythonEngine;

type
  [ComponentPlatforms(pidAllPlatforms)]
  TWxPython = class(TPyManagedPackage)
  private
    function AsVariant: variant;
  protected
    procedure Prepare(const AModel: TPyPackageModel); override;
    procedure ImportModule; override;
  public
    property wxpython: variant read AsVariant;
  end;

implementation

uses
  System.Variants,
  PyPackage.Manager.ManagerKind,
  PyPackage.Manager.Pip,
  PyPackage.Manager.Conda;

{ TWxPython }

function TWxPython.AsVariant: variant;
begin
  Result := inherited;
end;

procedure TWxPython.ImportModule;
begin
  MaskFPUExceptions(true);
  try
    inherited;
  finally
    MaskFPUExceptions(false);
  end;
end;

procedure TWxPython.Prepare(const AModel: TPyPackageModel);
begin
  inherited;
  with AModel do begin
    PackageName := 'wxpython';
    //WxPython from PIP
    PackageManagers.Add(
      TPyPackageManagerKind.pip,
      TPyPackageManagerPip.Create('wxpython'));
    //WxPython from Conda
    PackageManagers.Add(
      TPyPackageManagerKind.conda,
      TPyPackageManagerConda.Create('wxpython'));
  end;
end;

end.
