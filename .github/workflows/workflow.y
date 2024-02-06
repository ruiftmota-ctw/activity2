name: WorkFlow

run-name: ${{ github.actor }} Workflow group 2
on: [push]
jobs:
  check-bats-version:
    runs-on: ubuntu-latest
    steps:
      - name: Check out repository code
        uses: actions/checkout@v4
      - name: Install Nodejs
        uses: actions/setup-node@v4
      - name: Install dependencies
        run: npm install -y
      - name: Test App
        run: npm test
      - name: Start App
        run: npm start &
      - name: Output to JSON File
        run: wget localhost:3000/api/latest-releases
      - name: Upload a Build Artifact 
        uses: actions/upload-artifact@v4.3.1
        with:
          name: my-artifact
          path: latest-releases
