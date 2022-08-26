tableextension 50017 BankAccReconciliation extends "Bank Acc. Reconciliation"
{
    fields
    {
        field(50000; "Sellect All"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                BankAccReconLineNN: Record "Bank Acc. Reconciliation Line";
            begin
                Clear(BankAccReconLineNN);
                BankAccReconLineNN.SetRange("Bank Account No.", "Bank Account No.");
                BankAccReconLineNN.SetRange("Statement No.", "Statement No.");
                BankAccReconLineNN.ModifyAll("Ready for Application", "Sellect All");
                //IF BankAccReconLineNN.FINDFIRST THEN
                //REPEAT
                //  IF "Sellect All" = TRUE THEN BEGIN
                //    BankAccReconLine."Ready for Application" := TRUE;
                // BankAccReconLine.MODIFY;
                //  END
                //  ELSE BEGIN
                //    BankAccReconLine."Ready for Application" := FALSE;
                //  BankAccReconLine.MODIFY;
                //  END;
                //  MESSAGE(FORMAT(BankAccReconLineNN."Statement Amount"));
                //UNTIL BankAccReconLineNN.NEXT = 0;
            end;
        }
    }
}