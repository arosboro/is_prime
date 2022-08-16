// The 'is_prime.aleo' program.
program is_prime.aleo;

record prime:
    owner as address.private;
    gates as u64.private;
    number as u32.private;
    iterations as u32.private;
    canary as boolean.public;
    is_prime as boolean.public;

function mint_prime_token:
    input r0 as address.private;
    input r1 as u32.private;

    cast r0 0u64 r1 1u32 true false into r2 as prime.record;
    output r2 as prime.record;

function prove_prime_token:
    input r0 as prime.record;

    is.eq r0.number r0.iterations into r1; // check whether to keep iterating

    // iterate first
    ternary r1 0u32 1u32 into r2;   // Only iterate when the proof is incomplete
    add r0.iterations r2 into r3;   // r0.iterations

    // corner case (r6)
    is.eq r0.number 0u32 into r4;  // r0.number is 0
    is.eq r0.number 1u32 into r5;  // r0.number is 1
    or r4 r5 into r6;              // r0.number is 0 or 1

    // r0.number == r0.iterations: it divides by itself and hasn't returned false yet (r7)
    is.eq r0.number r3 into r7;

    // base cases (r11)
    mod r0.number r3 into r8;
    is.eq r8 0u32 into r9;  // n % i == 0
    not r7 into r10;        // n != i
    and r9 r10 into r11;    // n % i == 0 && n != i

    or r6 r11 into r12;                    // (n == 0 || n == 1) || (n % i == 0 && n != i)
    ternary r12 false r0.canary into r13;  // kill the canary if necessary
    and r13 r7 into r14;                   // assess prime (r7 true while r12 remains false)

    cast r0.owner r0.gates r0.number r3 r13 r14 into r15 as prime.record;
    output r15 as prime.record;

function validate_prime_record:
    input r0 as prime.record;

    is.eq r0.iterations r0.number into r1;
    and r1 r0.canary into r2;
    and r0.is_prime r2 into r3;
    output r3 as boolean.public;