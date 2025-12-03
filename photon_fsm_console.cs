using System;

class PhotonFSM_Auto
{
    static void Main()
    {
        Console.WriteLine("=== AUTO-GENERATED SIMULASI PHOTON FSM (64 Kombinasi) ===\n");

        Console.WriteLine("S1 S2 S3 S4 S5 S6 | STATE | A1 A2 A3 A4 A5 A6");
        Console.WriteLine("-------------------------------------------------------------");

        // Loop semua kombinasi 6-bit (0–63)
        for (int i = 0; i < 64; i++)
        {
            // Ambil bit sensor
            int S1 = (i >> 5) & 1;
            int S2 = (i >> 4) & 1;
            int S3 = (i >> 3) & 1;
            int S4 = (i >> 2) & 1;
            int S5 = (i >> 1) & 1;
            int S6 = (i >> 0) & 1;

            // === Logic Gates ===
            int D2 = Or(S2, And(S4, S5), And(S4, S6));
            int D1 = Or(S1, S3, S5);
            int D0 = Or(S4, S5, And(S4, S5));

            int q2 = D2;
            int q1 = D1;
            int q0 = D0;
            string state = $"{q2}{q1}{q0}";

            // === Actuator Logic ===
            int A1 = q0;
            int A2 = q1;
            int A3 = (q2 == 1 && q1 == 0 && q0 == 0) ? 1 : 0;
            int A4 = ((q1 == 1 && q0 == 1) || (q2 == 1 && q0 == 1)) ? 1 : 0;
            int A5 = q0;
            int A6 = q0;

            // === Output Baris Tabel ===
            Console.WriteLine($"{S1}  {S2}  {S3}  {S4}  {S5}  {S6}   |  {state}  |  {A1}  {A2}  {A3}  {A4}  {A5}  {A6}");
        }

        Console.WriteLine("-------------------------------------------------------------");
        Console.WriteLine("\nSelesai menghasilkan 64 kombinasi sensor.");
    }

    // Helper Boolean Functions
    static int And(int a, int b) => (a == 1 && b == 1) ? 1 : 0;

    static int Or(params int[] vals)
    {
        foreach (var v in vals)
            if (v == 1) return 1;
        return 0;
    }
}
