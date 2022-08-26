codeunit 50001 "Amount In Word"
{
    trigger OnRun();
    begin
    end;

    var
        Text032: Label 'ONE';
        Text033: Label 'TWO';
        Text034: Label 'THREE';
        Text035: Label 'FOUR';
        Text036: Label 'FIVE';
        Text037: Label 'SIX';
        Text038: Label 'SEVEN';
        Text039: Label 'EIGHT';
        Text040: Label 'NINE';
        Text041: Label 'TEN';
        Text042: Label 'ELEVEN';
        Text043: Label 'TWELVE';
        Text044: Label 'THIRTEEN';
        Text045: Label 'FOURTEEN';
        Text046: Label 'FIFTEEN';
        Text047: Label 'SIXTEEN';
        Text048: Label 'SEVENTEEN';
        Text049: Label 'EIGHTEEN';
        Text050: Label 'NINETEEN';
        Text051: Label 'TWENTY';
        Text052: Label 'THIRTY';
        Text053: Label 'FORTY';
        Text054: Label 'FIFTY';
        Text055: Label 'SIXTY';
        Text056: Label 'SEVENTY';
        Text057: Label 'EIGHTY';
        Text058: Label 'NINETY';
        Text059: Label 'THOUSAND';
        Text060: Label 'MILLION';
        Text061: Label 'BILLION';
        Text890: Label '"CENTS "';
        Text026: Label 'ZERO';
        Text028: Label 'AND';
        Text027: Label 'HUNDRED';
        Text029: Label '%1 results in a written number that is too long.';
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        NumberText: array[3] of Text[100];

    procedure FormatNoText(var NoText: array[3] of Text[80]; No: Decimal; CurrencyCode: Code[10]);
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
        TensDec: Integer;
        Onesdec: Integer;
    begin
        Clear(NoText);
        NoTextIndex := 1;
        NoText[1] := '';

        if (No < 1) then begin
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text026);
        end
        else begin
            for Exponent := 4 downto 1 do begin
                PrintExponent := false;
                Ones := No div Power(1000, Exponent - 1);
                Hundreds := Ones div 100;
                Tens := (Ones mod 100) div 10;
                Ones := Ones mod 10;
                if Hundreds > 0 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, Text027);
                end;
                if Tens >= 2 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    if Ones > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                end else
                    if (Tens * 10 + Ones) > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                if PrintExponent And (Exponent > 1) then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(1000, Exponent - 1);
            end;
        end;

        if No > 0 then begin
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text028);

            TensDec := ((No * 100) mod 100) div 10;
            Onesdec := (No * 100) mod 10;
            if TensDec >= 2 then begin
                AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[TensDec]);
                if Onesdec > 0 then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Onesdec]);
            end else
                if (TensDec * 10 + Onesdec) > 0 then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[TensDec * 10 + Onesdec])
                else
                    AddToNoText(NoText, NoTextIndex, PrintExponent, Text026);
            if (CurrencyCode <> '') then
                AddToNoText(NoText, NoTextIndex, PrintExponent, ' ONLY')
            else
                AddToNoText(NoText, NoTextIndex, PrintExponent, ' CENTS ONLY');
        end else
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' ONLY');

        if CurrencyCode <> '' then
            AddToNoText(NoText, NoTextIndex, PrintExponent, CurrencyCode);
    end;

    local procedure AddToNoText(var NoText: array[3] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30]);
    begin
        PrintExponent := TRUE;

        WHILE STRLEN(NoText[NoTextIndex] + '  ' + AddText) > MAXSTRLEN(NoText[1]) DO begin
            NoTextIndex := NoTextIndex + 1;
            if NoTextIndex > ARRAYLEN(NoText) then
                ERROR(Text029, AddText);
        end;

        NoText[NoTextIndex] := DELCHR(NoText[NoTextIndex] + '  ' + AddText, '<');
    end;

    procedure InitTextVariable();
    begin
        OnesText[1] := Text032;
        OnesText[2] := Text033;
        OnesText[3] := Text034;
        OnesText[4] := Text035;
        OnesText[5] := Text036;
        OnesText[6] := Text037;
        OnesText[7] := Text038;
        OnesText[8] := Text039;
        OnesText[9] := Text040;
        OnesText[10] := Text041;
        OnesText[11] := Text042;
        OnesText[12] := Text043;
        OnesText[13] := Text044;
        OnesText[14] := Text045;
        OnesText[15] := Text046;
        OnesText[16] := Text047;
        OnesText[17] := Text048;
        OnesText[18] := Text049;
        OnesText[19] := Text050;

        TensText[1] := '';
        TensText[2] := Text051;
        TensText[3] := Text052;
        TensText[4] := Text053;
        TensText[5] := Text054;
        TensText[6] := Text055;
        TensText[7] := Text056;
        TensText[8] := Text057;
        TensText[9] := Text058;

        ExponentText[1] := '';
        ExponentText[2] := Text059;
        ExponentText[3] := Text060;
        ExponentText[4] := Text061;
    end;
}

