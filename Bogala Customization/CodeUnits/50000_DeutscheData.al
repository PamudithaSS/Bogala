codeunit 50000 "Deutsche Data"
{
    trigger OnRun();
    begin
        Xmlport.Run(50004, true);
    end;
}

