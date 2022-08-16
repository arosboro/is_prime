# is_prime.aleo

## Build Guide

To compile this Aleo program, run:
```bash
aleo build
```

To run it:
```bash
aleo run mint_prime_token aleo1lr6ap3ed4q823wek3kk9eha3e8e98wv40x578zhl6afmds2twqxs8szyj4 5u32
```

The output:
```bash
"{
  owner: aleo1lr6ap3ed4q823wek3kk9eha3e8e98wv40x578zhl6afmds2twqxs8szyj4.private,
  gates: 0u64.private,
  number: 5u32.private,
  iterations: 1u32.private,
  canary: true.public,
  is_prime: false.public,
  _nonce: 603339317380415816314570888404126663464436332980512234750917908760393090867group.public
}"
```

Next steps, verify:

```bash
aleo run prove_prime_token "{
  owner: aleo1lr6ap3ed4q823wek3kk9eha3e8e98wv40x578zhl6afmds2twqxs8szyj4.private,
  gates: 0u64.private,
  number: 5u32.private,
  iterations: 1u32.private,
  canary: true.public,
  is_prime: false.public,
  _nonce: 603339317380415816314570888404126663464436332980512234750917908760393090867group.public
}"
aleo run prove_prime_token "{
  owner: aleo1lr6ap3ed4q823wek3kk9eha3e8e98wv40x578zhl6afmds2twqxs8szyj4.private,
  gates: 0u64.private,
  number: 5u32.private,
  iterations: 2u32.private,
  canary: true.public,
  is_prime: false.public,
  _nonce: 6328869172842952576813143067373849549188650736300757547383240395187818915446group.public
}"
aleo run prove_prime_token "{
  owner: aleo1lr6ap3ed4q823wek3kk9eha3e8e98wv40x578zhl6afmds2twqxs8szyj4.private,
  gates: 0u64.private,
  number: 5u32.private,
  iterations: 3u32.private,
  canary: true.public,
  is_prime: false.public,
  _nonce: 248329312141775632021658271280856324179595097992133796740743937862232527036group.public
}"
aleo run prove_prime_token "{
  owner: aleo1lr6ap3ed4q823wek3kk9eha3e8e98wv40x578zhl6afmds2twqxs8szyj4.private,
  gates: 0u64.private,
  number: 5u32.private,
  iterations: 4u32.private,
  canary: true.public,
  is_prime: false.public,
  _nonce: 7879508746557493898655206073250219079880128488601554336586527098259605947701group.public
}"
```

Output:

```bash
"{
  owner: aleo1lr6ap3ed4q823wek3kk9eha3e8e98wv40x578zhl6afmds2twqxs8szyj4.private,
  gates: 0u64.private,
  number: 5u32.private,
  iterations: 5u32.private,
  canary: true.public,
  is_prime: true.public,
  _nonce: 5713367399487472733591011170776859178690336536443012147369880313874690987675group.public
}"
```

Example output for a non-prime, 4:

```bash
"{
  owner: aleo1lr6ap3ed4q823wek3kk9eha3e8e98wv40x578zhl6afmds2twqxs8szyj4.private,
  gates: 0u64.private,
  number: 4u32.private,
  iterations: 2u32.private,
  canary: false.public,
  is_prime: false.public,
  _nonce: 247015275615163886871000029275079704803284513076811046962610271273711999414group.public
}"
```
