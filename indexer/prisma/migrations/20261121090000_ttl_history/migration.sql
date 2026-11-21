ALTER TABLE "StorageChange" ADD COLUMN "keyHash" TEXT;
CREATE INDEX "StorageChange_keyHash_idx" ON "StorageChange"("keyHash");
CREATE TABLE "TtlChange" (
  "id" TEXT NOT NULL,
  "keyHash" TEXT NOT NULL,
  "liveUntilLedger" INTEGER,
  "ledger" INTEGER NOT NULL,
  "txHash" TEXT NOT NULL,
  CONSTRAINT "TtlChange_pkey" PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX "TtlChange_txHash_keyHash_key" ON "TtlChange"("txHash", "keyHash");
CREATE INDEX "TtlChange_keyHash_ledger_idx" ON "TtlChange"("keyHash", "ledger");
