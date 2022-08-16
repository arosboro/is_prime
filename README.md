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
  iterations: 2u32.private,
  canary: false.public,
  _nonce: 6786340062939823377029634299017058544042714779065363921903655949031855077293group.public
}
"
```

Next steps, verify:

```bash
aleo run prove_prime_token "{
  owner: aleo1lr6ap3ed4q823wek3kk9eha3e8e98wv40x578zhl6afmds2twqxs8szyj4.private,
  gates: 0u64.private,
  number: 5u32.private,
  iterations: 2u32.private,
  canary: false.public,
  _nonce: 6786340062939823377029634299017058544042714779065363921903655949031855077293group.public
}"
aleo run prove_prime_token "{
  owner: aleo1lr6ap3ed4q823wek3kk9eha3e8e98wv40x578zhl6afmds2twqxs8szyj4.private,
  gates: 0u64.private,
  number: 5u32.private,
  iterations: 3u32.private,
  canary: false.public,
  _nonce: 2716198809378205391914982020143714092174642339782749332069558411160799870873group.public
}"
aleo run prove_prime_token "{
  owner: aleo1lr6ap3ed4q823wek3kk9eha3e8e98wv40x578zhl6afmds2twqxs8szyj4.private,
  gates: 0u64.private,
  number: 5u32.private,
  iterations: 4u32.private,
  canary: false.public,
  _nonce: 5175584816067970736570307079932297433171951306714395019500456281657756765395group.public
}"
aleo run prove_prime_token "{
  owner: aleo1lr6ap3ed4q823wek3kk9eha3e8e98wv40x578zhl6afmds2twqxs8szyj4.private,
  gates: 0u64.private,
  number: 5u32.private,
  iterations: 5u32.private,
  canary: false.public,  <--- this should be true
  _nonce: 4654998286738639742127353247137168328814257952593647199338092376033887167307group.public
}"
```

Output:

```bash
"{
  owner: aleo1lr6ap3ed4q823wek3kk9eha3e8e98wv40x578zhl6afmds2twqxs8szyj4.private,
  gates: 0u64.private,
  number: 3u32.private,
  iterations: 3u32.private,
  canary: true.public,
  _nonce: 4777302952831099819779485097517628248126635588727278619966342020907087569017group.public
}"
```

