(********************************************************
 * Part of Python for Delphi - Data Sciences libraries  *
 *                                                      *
 * Copyright (c) 2022 by Embarcadero Technologies       *
 * Licensed under the MIT License                       *
 *                                                      *
 * For full license text and more information visit:    *
 * https://github.com/Embarcadero/P4D-Data-Sciences     *
 ********************************************************)


unit XlsxWriterReg;

interface

procedure Register();

implementation

uses
  Classes, XlsxWriter;

procedure Register();
begin
  RegisterComponents('Python - Data Science Ecosystem', [TXlsxWriter]);
end;

end.
