unit unt_str_utils;
 interface
 type
   TStrUtils = class
   private
     FStr: String;
   public
     Constructor Create(const AStr : string);
     function Equals(const AStr : string):boolean;
     function EqualsIgnoreCase(const AStr : string):boolean;
     function ToUpper():string;
     function ToLower():string;
     property str : String read FStr write FStr;

   end;

implementation
  uses SysUtils;
  constructor TStrUtils.Create(const AStr: string);
  begin
   Self.FStr := AStr;
  end;
  function TStrUtils.Equals(const AStr: string): boolean;
  begin
   result := AStr = Self.FStr;
  end;
  function TStrUtils.EqualsIgnoreCase(const AStr: string): boolean;
  begin
   Result := UpperCase(AStr) = Self.ToUpper;
  end;
   function TStrUtils.ToLower: string;
  begin
   Result := LowerCase(Self.FStr);
  end;
  function TStrUtils.ToUpper: string;
  begin
   Result := UpperCase(Self.FStr);
end;

