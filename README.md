# Photon Digital Quantum FSM
Verilog HDL Implementation – Step 1 to Step 8

Repository ini berisi implementasi rangkaian digital Photon Edge Processor menggunakan Verilog. Sistem terdiri dari enam sensor, enam aktuator, persamaan logika (Step 7), dan Finite State Machine (Step 4–6). Simulasi dilakukan menggunakan JDoodle.

------------------------------------------------------------
1. File dalam Repository
------------------------------------------------------------

photon_fsm.v               → Modul utama HDL
testbench_photon_fsm.v     → Testbench HDL
jdoodle_simulation.png     → Hasil simulasi JDoodle
README.md                  → Dokumentasi project

------------------------------------------------------------
2. Sensor dan Aktuator
------------------------------------------------------------

Sensor:
S1 = Vibration
S2 = Thermal
S3 = Acoustic
S4 = Photon
S5 = Damage
S6 = Echo

Aktuator:
A1 = Photon output
A2 = Vibration/Damage control
A3 = Thermal control
A4 = Multi-event alarm
A5 = Photon/Damage indicator
A6 = Secondary indicator

------------------------------------------------------------
3. Persamaan Logika (Step 7)
------------------------------------------------------------

D2 = S2 + S4·S5 + S4·S6
D1 = S1 + S3 + S5
D0 = S4 + S5 + S4·S5

------------------------------------------------------------
4. Penyandian State (FSM)
------------------------------------------------------------

State  Q2 Q1 Q0   Nama
Q0     0  0  0    Idle
Q1     0  0  1    Photon Process
Q2     0  1  0    Vibration Control
Q3     0  1  1    Damage Inspection
Q4     1  0  0    Thermal Control
Q5     1  0  1    Multi Event Alarm

------------------------------------------------------------
5. Logika Aktuator
------------------------------------------------------------

A1 = q0
A2 = q1
A3 = q2 & ~q1 & ~q0
A4 = (q1 & q0) + (q2 & q0)
A5 = q0
A6 = q0

Interpretasi:
- A1 aktif pada q0 = 1
- A2 aktif pada q1 = 1
- A3 aktif hanya pada Q4
- A4 aktif pada Q3 dan Q5
- A5 dan A6 mengikuti q0

------------------------------------------------------------
6. Hasil Simulasi
------------------------------------------------------------

Hasil output dapat dilihat pada gambar:
jdoodle_simulation.png

Simulasi mencakup kondisi:
- Semua sensor OFF → Q0
- Photon ON → Q1
- Damage ON → Q3
- Thermal ON → Q4
- Photon + Damage → Q5

------------------------------------------------------------
7. Kesimpulan
------------------------------------------------------------

Implementasi HDL berhasil mensimulasikan:
- Sensor → Kombinasi Logika → FSM → Aktuator
- Testbench berjalan tanpa error
- Step 1–8 terpenuhi semua

------------------------------------------------------------
Dibuat oleh:
Moch Ilham Fandy Ramadhan
