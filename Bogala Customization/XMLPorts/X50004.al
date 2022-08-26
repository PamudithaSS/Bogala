xmlport 50004 "Deutsche bank data exporting N"
{
    Direction = Export;
    //Encoding = UTF8;
    FieldDelimiter = '<None>';
    FieldSeparator = ';';
    FileName = '\\MISDNAV-2013\outbound\';
    Format = VariableText;
    FormatEvaluate = Legacy;
    Permissions = TableData 271 = rm;

    schema
    {
        textelement(Root)
        {
            tableelement("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                RequestFilterFields = "Document No.", "Bank Account No.", "Posting Date";
                XmlName = 'BankAccountLedgerEntry';
                SourceTableView = SORTING("Document Type", "Bank Account No.", "Posting Date")
                                  WHERE("Document Type" = const(Payment), "Credit Amount" = filter(<> 0), Open = const(true), Exported = const(false), Reversed = const(false));
                textattribute(F1)
                { }
                textattribute(F2)
                { }
                textattribute(F3)
                { }
                textattribute(F4)
                { }
                textattribute(F5)
                { }
                textattribute(F6)
                { }
                textattribute(NullT1)
                { }
                textattribute(F8)
                { }
                textattribute(F9)
                { }
                textattribute(F10)
                { }
                textattribute(NullT2)
                { }
                textattribute(NullT3)
                { }
                textattribute(NullT4)
                { }
                textattribute(NullT5)
                { }
                textattribute(F15)
                { }
                textattribute(F16)
                { }
                textattribute(NullT6)
                { }
                textattribute(F18)
                { }
                textattribute(F19)
                { }
                textattribute(NullT7)
                { }
                textattribute(NullT8)
                { }
                textattribute(NullT9)
                { }
                textattribute(NullT10)
                { }
                textattribute(F24)
                { }
                textattribute(F25)
                { }
                textattribute(F26)
                { }
                textattribute(F27)
                { }
                textattribute(F28)
                { }
                textattribute(NullT13)
                { }
                textattribute(NullT14)
                { }
                textattribute(F31)
                { }
                textattribute(F32)
                { }
                textattribute(F33)
                { }
                textattribute(NullT15)
                { }
                textattribute(F35)
                { }
                textattribute(F36)
                { }
                textattribute(F37)
                { }
                textattribute(F38)
                { }
                textattribute(F39)
                { }
                textattribute(NullT16)
                { }
                textattribute(NullT17)
                { }
                textattribute(NullT18)
                { }
                textattribute(NullT19)
                { }
                textattribute(NullT20)
                { }
                textattribute(NullT21)
                { }
                textattribute(NullT22)
                { }
                textattribute(NullT23)
                { }
                textattribute(NullT24)
                { }
                textattribute(NullT25)
                { }
                textattribute(NullT26)
                { }
                textattribute(NullT27)
                { }
                textattribute(NullT28)
                { }
                textattribute(NullT29)
                { }
                textattribute(NullT30)
                { }
                textattribute(NullT31)
                { }
                textattribute(NullT32)
                { }
                textattribute(F57)
                { }
                textattribute(F58)
                { }
                textattribute(F59)
                { }
                textattribute(NullT33)
                { }
                textattribute(NullT34)
                { }
                textattribute(NullT35)
                { }
                textattribute(F63)
                { }
                textattribute(F64)
                { }
                textattribute(NullT36)
                { }
                textattribute(F66)
                { }
                textattribute(NullT38)
                { }

                trigger OnAfterGetRecord();
                begin
                    F1 := '';
                    F2 := '';
                    F3 := '';
                    F4 := '';
                    F9 := '';
                    F10 := '';
                    F5 := '';
                    F18 := '';
                    F26 := '';
                    F27 := '';
                    F28 := '';
                    F31 := '';
                    F24 := '';
                    F25 := '';
                    F32 := '';
                    F33 := '';
                    F35 := '';
                    F36 := '';
                    F37 := '';
                    F38 := '';
                    F39 := '';
                    F57 := '';
                    F58 := '';
                    F59 := '';
                    F64 := '';
                    F66 := '';

                    F2 := "Bank Account Ledger Entry"."Currency Code";
                    if recBank.Get("Bank Account Ledger Entry"."Bank Account No.") then begin
                        F1 := Format(recBank."Bank Account No.");
                        if "Bank Account Ledger Entry"."Currency Code" = '' then begin
                            F2 := recGLsetup."LCY Code";
                        end;
                        F3 := F1;
                        F4 := F2;
                        F5 := Format(TransactionMode);
                        F6 := recGLsetup."Instruction for Charges";
                        F8 := recGLsetup."Bulk Posting";
                        F66 := CopyStr("Bank Account Ledger Entry"."Description 2", 1, 80);
                    end;
                    if "10-TransactionDate" = 0D then
                        F10 := Format("Bank Account Ledger Entry"."Posting Date", 0, '<Day,2>') + Format("Bank Account Ledger Entry"."Posting Date", 0, '<Month,2>') + Format(DATE2DMY("Bank Account Ledger Entry"."Posting Date", 3))
                    else
                        F10 := Format("10-TransactionDate", 0, '<Day,2>') + Format("10-TransactionDate", 0, '<Month,2>') + Format(DATE2DMY("10-TransactionDate", 3));

                    if "Bank Account Ledger Entry"."Currency Code" = '' then begin
                        F9 := recGLsetup."LCY Code";
                    end;
                    if "15-ScheduleDate" = 0D then
                        F15 := Format("Bank Account Ledger Entry"."Posting Date", 0, '<Day,2>') + Format("Bank Account Ledger Entry"."Posting Date", 0, '<Month,2>') + Format(DATE2DMY("Bank Account Ledger Entry"."Posting Date", 3))
                    else
                        F15 := Format("15-ScheduleDate", 0, '<Day,2>') + Format("15-ScheduleDate", 0, '<Month,2>') + Format(DATE2DMY("15-ScheduleDate", 3));
                    F18 := Format("Bank Account Ledger Entry"."Credit Amount", 0, '<Sign><Integer><Decimals,3>');
                    if ((TransactionMode = TransactionMode::ACQ) OR (TransactionMode = TransactionMode::ABQ)) then begin
                        case "Bank Account Ledger Entry"."Bal. Account Type" OF
                            "Bank Account Ledger Entry"."Bal. Account Type"::Vendor:
                                begin
                                    if (recVendor.GET("Bank Account Ledger Entry"."Bal. Account No.")) then begin
                                        F26 := CopyStr(recVendor."No.", 1, 10);
                                        F27 := recVendor.Name;
                                        F31 := CopyStr(recVendor.Address, 1, 35);
                                        F32 := CopyStr(recVendor."Address 2", 1, 35);
                                        F33 := CopyStr(recVendor.City, 1, 35);
                                        F59 := CopyStr(recVendor."Fax No.", 1, 70);
                                    end;
                                end;
                            "Bank Account Ledger Entry"."Bal. Account Type"::"Bank Account":
                                begin
                                    if (recBank.GET("Bank Account Ledger Entry"."Bal. Account No.")) then begin
                                        F26 := CopyStr(recBank."No.", 1, 10);
                                        F27 := recBank.Name;
                                        F31 := CopyStr(recBank.Address, 1, 35);
                                        F32 := CopyStr(recBank."Address 2", 1, 35);
                                        F33 := CopyStr(recBank.City, 1, 34);
                                    end;
                                end;
                        end;
                        F24 := "Bank Account Ledger Entry"."Special Instruction 1";
                        F25 := "Bank Account Ledger Entry"."Special Instruction 2";
                        F57 := CopyStr("Bank Account Ledger Entry"."Document No.", 1, 35);
                        F64 := Format("Bank Account Ledger Entry"."Entry No.");
                    end;
                    if ((TransactionMode = TransactionMode::SDC) OR (TransactionMode = TransactionMode::APH) OR (TransactionMode = TransactionMode::RTS) OR (TransactionMode = TransactionMode::WT)) then begin
                        case "Bank Account Ledger Entry"."Bal. Account Type" OF
                            "Bank Account Ledger Entry"."Bal. Account Type"::Vendor:
                                begin
                                    if (recVendor.GET("Bank Account Ledger Entry"."Bal. Account No.")) then begin
                                        F26 := CopyStr(recVendor."No.", 1, 10);
                                        F27 := recVendor.Name;
                                        F28 := recVendor.BENE_ACCNO;
                                        if ((TransactionMode = TransactionMode::SDC)) then//if transaction mode is SDC
                                            F35 := CopyStr(recVendor.BENE_BRANCH_CODE, 1, 10);
                                        if NOT ((TransactionMode = TransactionMode::SDC)) then
                                            F38 := CopyStr(recVendor."SWIFT Code", 1, 11);
                                        F39 := CopyStr(recVendor.BENE_BANK_CODE, 1, 17);
                                        F59 := CopyStr(recVendor."Fax No.", 1, 70);
                                    end;
                                end;
                            "Bank Account Ledger Entry"."Bal. Account Type"::"Bank Account":
                                begin
                                    if (recBank.GET("Bank Account Ledger Entry"."Bal. Account No.")) then begin
                                        F26 := CopyStr(recBank."No.", 1, 10);
                                        F27 := recBank.Name;
                                        F28 := recBank."Bank Account No.";
                                        if ((TransactionMode = TransactionMode::SDC)) then//if transaction mode is SDC
                                            F35 := CopyStr(recBank."Bank Code" + ' ' + recBank."Branch Code", 1, 10);
                                        if NOT ((TransactionMode = TransactionMode::SDC)) then//if transaction mode is not SDC apply to rest of modes
                                            F38 := CopyStr(recBank."SWIFT Code", 1, 11);
                                    end;
                                end;
                        end;
                        F57 := CopyStr("Bank Account Ledger Entry"."Document No.", 1, 35);
                        F64 := Format("Bank Account Ledger Entry"."Entry No.");
                    end;
                    "Bank Account Ledger Entry".Exported := TRUE;
                    "Bank Account Ledger Entry".MODIFY;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Transaction Mode"; TransactionMode)
                {
                    ApplicationArea = All;
                }
                field("Transaction Date"; "10-TransactionDate")
                {
                    ApplicationArea = All;
                }
                field("Schedule Date"; "15-ScheduleDate")
                {
                    ApplicationArea = All;
                }
                field("Restricted Transction Flag"; F16)
                {
                    ApplicationArea = All;
                }
                field("Transaction Instruction"; F19)
                {
                    ApplicationArea = All;
                }
                field("Instruction for Charges"; F6)
                {
                    ApplicationArea = All;
                }
                field("Urgent Flag"; F8)
                {
                    ApplicationArea = All;
                }
                field("Export File Name"; recGLsetup."Export File Path" + ' ' + FileName)
                {
                    ApplicationArea = All;
                }
                field("Transaction Type"; F63)
                {
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }

    trigger OnInitXmlPort();
    begin

        IF NOT (recGLsetup.GET) then currXMLport.BREAK;

        FileName :=
        Format((WORKDATE), 0, '<Day,2>') + '.' + Format((WORKDATE), 0, '<Month,2>') + '.' + Format(DATE2DMY((WORKDATE), 3))
        + ' ' + INSSTR(DELSTR(INSSTR(DELSTR(Format(TIME), 3, 1), '.', 3), 6, 1), '.', 6);
        currXMLport.FILENAME := recGLsetup."Export File Path" + '\' + FileName + '.txt';
        F6 := recGLsetup."Instruction for Charges";
        F8 := recGLsetup."Bulk Posting";
    end;

    var
        recVendor: Record Vendor;
        recBank: Record "Bank Account";
        recGLsetup: Record "General Ledger Setup";
        "10-TransactionDate": Date;
        "15-ScheduleDate": Date;
        FileName: Text[250];
        TransactionMode: Option ABQ,ACQ,SDC,APH,RTS,WT;
}

