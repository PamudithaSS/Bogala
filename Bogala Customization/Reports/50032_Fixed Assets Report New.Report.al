report 50032 "Fixed Assets Report New"
{
    // version Prasad

    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Fixed Assets Report New.rdl';

    dataset
    {
        dataitem("FA Ledger Entry"; "FA Ledger Entry")
        {
            //DataItemTableView = '';
            column(FALedgerEntryFANo; "FA Ledger Entry"."FA No.")
            {
            }
            column(FixedAssetDescription; FixedAsset.Description)
            {
            }
            column(FixedAssetDescription2; FixedAsset."Description 2")
            {
            }
            column(FALedgerEntryFALocationCode; "FA Ledger Entry"."FA Location Code")
            {
            }
            column(FALedgerEntryFAPostingDate; FALedgerEntry."FA Posting Date")
            {
            }
            column(FALedgerEntryAmount; FALedgerEntry.Amount)
            {
            }
            column(FixedAssetPhysicalIdentificationNumber; FixedAsset."Physical Identification Number")
            {
            }
            column(FALedgerEntry2Amount; ABS(DAmount))
            {
            }
            column(FADate; GETFILTER("FA Ledger Entry"."FA Posting Date"))
            {
            }
            column(EndDate; "End Date")
            {
            }
            column(AQAmount; AQAmount)
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(DAmount);
                CLEAR(AQAmount);

                IF NOT FixedAsset.GET("FA No.") THEN
                    CLEAR(FixedAsset);

                SETFILTER("FA Posting Date", '< %1', "End Date");

                FALedgerEntry.RESET;
                FALedgerEntry.SETFILTER("FA Posting Date", '< %1', "End Date");
                FALedgerEntry.SETFILTER("FA Posting Type", 'Acquisition Cost');
                FALedgerEntry.SETRANGE("FA No.", "FA No.");
                IF FALedgerEntry.FINDFIRST THEN
                    REPEAT
                        AQAmount += FALedgerEntry.Amount;
                    UNTIL FALedgerEntry.NEXT = 0;

                CLEAR(DAmount);
                FALedgerEntry2.RESET;
                FALedgerEntry2.SETFILTER("FA Posting Date", '< %1', "End Date");
                FALedgerEntry2.SETFILTER("FA Posting Type", 'Depreciation');
                FALedgerEntry2.SETRANGE("FA No.", "FA No.");
                IF FALedgerEntry2.FINDFIRST THEN
                    REPEAT
                        DAmount += FALedgerEntry2.Amount;
                    UNTIL FALedgerEntry2.NEXT = 0;


                IF "FA No." = '' THEN
                    CurrReport.SKIP;

                IF FALedgerEntry2."FA Posting Category" = FALedgerEntry2."FA Posting Category"::Disposal THEN
                    CurrReport.SKIP;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("End Date"; "End Date")
                {
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        FALedgerEntry: Record "FA Ledger Entry";
        FALedgerEntry2: Record "FA Ledger Entry";
        FixedAsset: Record "Fixed Asset";
        "End Date": Date;
        DAmount: Decimal;
        AQAmount: Decimal;
}

