# actions-crypto
a simple crypto script (symmetrical encryption), use **openssl enc -aes256** command.

### Important !!!
> Files are deleted after encryption and decryption

# usage
```yml
name: Test actions crypto
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - run: echo abc > test.file # test file
      - name: Encryption
        uses: shinhwagk/actions-crypto@0.0.1
        with:
          crypto-path: test.file # file or direcotry
          crypto-action: enc     # enc or dec
          crypto-password:  ${{ secrets.pass }} # passphrase
      - run: cat test.file || cat test.file.enc  # Files are deleted after encryption
      - name: Decryption
        uses: shinhwagk/actions-crypto@0.0.1
        with:
          crypto-path: test.file.enc # file or direcotry
          crypto-action: dec     # enc or dec
          crypto-password:  ${{ secrets.pass }} # passphrase
      - run: cat test.file.enc || cat test.file
```
