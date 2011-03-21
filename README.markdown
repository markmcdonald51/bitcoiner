    |_  o _|_ _  _  o __  _  __
    |_) |  |_(_ (_) | | |(/_ | 
    add bitcoin to your rails app

### what is it? ###

bitcoiner is [davout](https://github.com/davout)'s code used at [bitcoin-central.net](https://bitcoin-central.net/) (available on [github](https://github.com/davout/bitcoin-central)) made into a ruby gem.

### how do you set it up? ###

#### step 1: setting up the bitcoin client ####

1. install the actual bitcoin client.
    - [download](http://www.bitcoin.org/) the linux version (i'm assuming you're on a linux server/machine)
    - extract it to __$HOME/bitcoin__. for example, __users/dan/bitcoin__
    - your rails application will run and interact with "bitcoind" ([wiki explanation](https://en.bitcoin.it/wiki/Bitcoind)), which is the headless/guiless version of the client. the executable is located at __$HOME/bitcoin/bin/32/bitcoind.exe__.
  
2. create the configuration file.
    - create a directory __$HOME/.bitcoin__.
    - within it, create a __bitcoin.yml__ file. for example, the full path could look something like __users/dan/bitcoin.yml__
    - copy and paste [this configuration](https://en.bitcoin.it/wiki/Running_Bitcoin#Sample_Bitcoin.conf) into the file. these are all of the available options set to default values.

3. configure a username and password.
    - uncomment and change the rpcuser and rpcpassword.
    - for example,

            # You must set rpcuser and rpcpassword to secure the JSON-RPC api
            #rpcuser=Ulysseys
            #rpcpassword=YourSuperGreatPasswordNumber_385593
    
        should become something like:
    
                # You must set rpcuser and rpcpassword to secure the JSON-RPC api
                rpcuser=donaldduck
                rpcpassword=Jikald32AKD@!
    - note: you will repeat these values when you're setting up the bitcoiner gem

#### step 2: setting up the bitcoiner gem ####

2. add bitcoiner to your rails Gemfile

        gem 'bitcoiner'
    
3. run bundler to install bitcoiner and its dependencies

        $ bundle install
    
4. create bitcoiner's configuration file
    - create __bitcoiner.yml__ in the config folder of your rails application
    - within it, fill in:
  
                development:
                    url: http://localhost:8332/ # location of bitcoin server (default)
                    username: donaldduck # bitcoin.conf's rpcpassword rpcuser
                    password: Jikald32AKD@! # bitcoin.conf's rpcpassword
                test:
                    url: http://localhost:8332/
                    username: donaldduck
                    password: Jikald32AKD@!
                production:
                    url: http://localhost:8332/
                    username: donaldduck
                    password: Jikald32AKD@!

5. (optional): create a validator for bitcoin addresses

#### step 3: start the bitcoind server

        $ /users/dan/bitcoin/bin/32/bitcoind
    
### how do you use it? ###

- First, initialize the client:

        @bitcoiner = Bitcoiner::Client.new
        
    You can put this in the __ApplicationController__ so it's available to all controllers and pages.
        
- Now you can send any of the api calls to the bitcoin client ([full list](https://en.bitcoin.it/wiki/Original_Bitcoin_client/API_calls_list) on the bitcoin wiki)

- to make bitcoin methods more ruby-like, bitcoiner allows you to use underscores. 

        @bitcoiner.get_account_address(account)
    
    is treated the same as:
        
        @bitcoiner.getaccountaddress(account)

### examples ###

- list all of the addresses in the client:

        @bitcoiner.list_received_by_address 0, true
        #=> [{"address"=>"1JpnGuSXGMSNRY8PTFdQkR5r9beREPWnyt", "account"=>"Your Address", "label"=>"Your Address", "amount"=>0.0, "confirmations"=>0}]
        
- change an account name:

        @bitcoiner.set_accountd
        
- stop the bitcoin server:

        @bitcoiner.stop



