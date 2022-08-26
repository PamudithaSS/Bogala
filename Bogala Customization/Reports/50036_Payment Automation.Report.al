report 50036 "Payment Automation"
{
    // version ARJUNA-JIT

    Permissions = TableData 271 = rim;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {
            RequestFilterFields = "Document No.";

            trigger OnAfterGetRecord();
            begin
                Vendor.SETRANGE("No.", "Bal. Account No.");
                IF Vendor.FINDFIRST THEN;

                BankAccount.SETRANGE("No.", "Bank Account No.");
                IF BankAccount.FINDFIRST THEN;

                IF "Currency Code" = '' THEN
                    "Currency Code" := 'LKR';

                //Filepath1 := GeneralLeSetup."Export File Path"
                //              +PreTxt+FORMAT(CURRENTDATETIME,0,'<Day,2><Month,2><Year>')+'_'
                //                +"Document No."+'.txt';
                IF "Bank Account Ledger Entry"."Payment Type" <> 7 THEN
                    // Filepath1 := GeneralLeSetup."Export File Path" + PreTxtNew + "Document No." + '.txt'
                    Filepath1 := PreTxtNew + "Document No." + '.txt'
                ELSE
                    // Filepath1 := GeneralLeSetup."Export File Path" + PreTxtNewT + "Document No." + '.txt';
                    Filepath1 := PreTxtNewT + "Document No." + '.txt';

                // IF ERASE(Filepath1) THEN;
                // FileRec.CREATE(Filepath1);
                // FileRec.TEXTMODE := TRUE;
                // //FileRec.WRITEMODE := TRUE;
                IF "Bank Account Ledger Entry"."Payment Type" <> 7 THEN BEGIN
                    WriteTxt := ('D' + '|' + "Document No." + '|' + COPYSTR(Vendor.Name, 1, 35) + '|' + COPYSTR(Description, 1, 35) + '|' + Vendor.BENE_ACCNO + '|' + COPYSTR("Currency Code", 1, 3) + '|' + FORMAT(ABS(Amount), 0, 1) + '|' + COPYSTR(Description, 1, 35) + '|' + COPYSTR("Description 2", 1, 35)
                                + '|' + COPYSTR(Vendor.Address, 1, 35) + '|' + COPYSTR(Vendor."Address 2", 1, 35) + '|' + Vendor.City + '|' + BankAccount."Bank Account No." + '|' + Vendor.BENE_BANK_CODE + Vendor.BENE_BRANCH_CODE + '|' + Vendor."E-Mail" + '|' + Vendor.Contact + '|'
                                + FORMAT("Pick Up By") + '|' + FORMAT("Pick Up Method") + '|' + "External Document No." + '|' + FORMAT("Payment Type") + '|' + Vendor."SWIFT Code");
                END ELSE BEGIN
                    WriteTxt := ('D' + '|' + "Document No." + '|' + COPYSTR(Vendor.Name, 1, 35) + '|' + COPYSTR(Description, 1, 35) + '|' + Vendor.BENE_ACCNO + '|' + COPYSTR("Currency Code", 1, 3) + '|' + FORMAT(ABS(Amount), 0, 1) + '|' + COPYSTR(Description, 1, 35) + '|' + COPYSTR("Description 2", 1, 35)
                                + '|' + COPYSTR(Vendor.Address, 1, 35) + '|' + COPYSTR(Vendor."Address 2", 1, 35) + '|' + Vendor.City + '|' + DELCHR((BankAccount."Bank Account No."), '=', '-') + '|' + Vendor.BENE_BANK_CODE + Vendor.BENE_BRANCH_CODE + '|' + Vendor."E-Mail" + '|' + Vendor.Contact + '|'
                                + '' + '|' + FORMAT("Pick Up Method") + '|' + "External Document No." + '|' + FORMAT("Payment Type") + '|' + Vendor."SWIFT Code" + '|' + '' + '|' + 'TRFR' + '|' + '6' + DELSTR(Vendor.BENE_BANK_CODE, 1, 1) + '|' + Vendor.BENE_BRANCH_CODE);
                END;

                CRLF[1] := 13;
                CRLF[2] := 10;
                FileName := Filepath1; //need to change
                tmpBlob.CreateOutStream(MyOutStream, TextEncoding::Windows);

                MyOutStream.WriteText(WriteTxt);
                //OutStr.WriteText();  
                // for Counter := 1 to 5000000 do begin
                //     MyOutStream.WriteText(Format(Counter) + ': This is a line in the text file' + CRLF);
                //     //OutStr.WriteText();  
                // end;
                tmpBlob.CreateInStream(MyInStream, TextEncoding::Windows);

                DownloadFromStream(MyInStream, '', GeneralLeSetup."Export File Path", '', FileName);
                "Exported File" := TRUE;
                MODIFY;
            end;

            trigger OnPostDataItem();
            begin
                MESSAGE('Successfully Payment Automation File Created');
            end;

            trigger OnPreDataItem();
            begin
                CLEAR(FileRec);
                CLEAR(Filepath1);
                GeneralLeSetup.GET();
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Vendor: Record Vendor;
        FileRec: File;
        Filepath1: Text[250];
        GeneralLeSetup: Record "General Ledger Setup";
        BankAccount: Record "Bank Account";
        PreTxt: Label 'GC0112_MultiPayment_';
        PreTxtNew: Label 'GC0112_MULTICASHBGL_CC_';
        PreTxtNewT: Label 'CEFTSH2HC GC0112_MULTICASHBGL_CC_';
        //RJ
        myInt: Integer;
        //MyRecord: Record "Blob Table-BG";
        MyOutStream: OutStream;
        MyInStream: InStream;
        Result: Text;
        CRLF: Text[2];
        WriteTxt: Text;
        FileName: Text;
        tmpBlob: Codeunit "Temp Blob";
    //
}

