// The 'is_prime.aleo' program.
program is_prime.aleo;

record prime:
    owner as address.private;
    gates as u64.private;
    number as u32.private;
    iterations as u32.private;
    canary as boolean.public;

function mint_prime_token:
    input r0 as address.private;
    input r1 as u32.private;

    cast r0 0u64 r1 2u32 false into r2 as prime.record;
    output r2 as prime.record;

function prove_prime_token:
    input r0 as prime.record;

    // corner case (r4)
    is.eq r0.number 0u32 into r1;  // r1 is 0
    is.eq r0.number 1u32 into r2;  // r1 is 1
    or r1 r2 into r3;              // r1 is 0 or 1

    // r0.number == r0.iterations: it divides by itself and hasn't returned false yet (r4)
    is.eq r0.number r0.iterations into r4;

    // base cases (r6)
    mod r0.number r0.iterations into r5;
    is.eq r5 0u32 into r6;

    // iterate
    ternary r4 0u32 1u32 into r7;  // Only iterate when the proof is incomplete
    add r0.iterations r7 into r8;  // r0.iterations

    and r4 r6 into r9;                         // n == i and n % i == 0
    ternary r3 false r9 into r10;              // false if n == 0 or n == 1
    ternary r0.canary r0.canary r10 into r11;  // don't kill canary only bring it to life

    cast r0.owner r0.gates r0.number r8 r11 into r12 as prime.record;
    output r12 as prime.record;

function validate_prime_record:
    input r0 as prime.record;

    is.eq r0.iterations r0.number into r1;
    and r1 r0.canary into r2;
    output r2 as boolean.public;