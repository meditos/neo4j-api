NEO4J_HOME=/var/lib/neo4j

# Install the data science plugin
# data_science_plugin_url=https://s3-eu-west-1.amazonaws.com/com.neo4j.graphalgorithms.dist/graph-data-science/neo4j-graph-data-science-1.6.2-standalone.zip
# curl -O $data_science_plugin_url

# sudo apt install unzip
# unzip neo4j-graph-data-science-1.6.2-standalone.zip
# sudo mv neo4j-graph-data-science-1.6.2.jar $NEO4J_HOME/plugins

# Install the neosemantic plugin
neosemantics_plugin_url=https://github.com/neo4j-labs/neosemantics/releases/download/4.2.0.2/neosemantics-4.2.0.2.jar
wget $neosemantics_plugin_url
sudo mv neosemantics-* $NEO4J_HOME/plugins

# Update config file
NEO4J_CONF=/etc/neo4j/neo4j.conf
sudo chmod 777 $NEO4J_CONF
echo 'dbms.unmanaged_extension_classes=n10s.endpoint=/rdf' >> $NEO4J_CONF

# echo 'dbms.security.procedures.allowlist=gds.*,n10s.*' >> $NEO4J_CONF
# Before version 4.2
# echo 'dbms.security.procedures.whitelist=gds.*,n10s.*' >> $NEO4J_CONF
# echo 'dbms.security.procedures.unrestricted=gds.*,n10s.*' >> $NEO4J_CONF

# Change password
sshd_config_file=/etc/ssh/sshd_config
sudo chmod 777 $sshd_config_file
# sudo nano $sshd_config_file
# Change PasswordAuthentication yes
echo 'PasswordAuthentication yes' >> $sshd_config_file
echo 'PermitRootLogin yes' >> $sshd_config_file
echo -e 'act_secret\nact_secret' | sudo -S passwd ubuntu
sudo service sshd restart

# Restart service
# systemctl cat neo4j
# systemctl restart neo4j

systemctl stop neo4j
# sudo /usr/bin/java -cp /var/lib/neo4j/plugins:/etc/neo4j:/usr/share/neo4j/lib/*:/var/lib/neo4j/plugins/* -server -XX:+UseG1GC -XX:-OmitStackTraceInFastThrow -XX:+AlwaysPreTouch -XX:+UnlockExperimentalVMOptions -XX:+TrustFinalNonStaticFields -XX:+DisableExplicitGC -Djdk.tls.ephemeralDHKeySize=2048 -Djdk.tls.rejectClientInitiatedRenegotiation=true -XX:+ExitOnOutOfMemoryError -Dunsupported.dbms.udc.source=amazon-ami-SINGLE -Dfile.encoding=UTF-8 org.neo4j.server.CommunityEntryPoint --home-dir=/var/lib/neo4j --config-dir=/etc/neo4j
sudo /usr/lib/jvm/java-11-openjdk-amd64/bin/java -cp /var/lib/neo4j/plugins/*:/etc/neo4j/*:/usr/share/neo4j/lib/* -XX:+UseG1GC -XX:-OmitStackTraceInFastThrow -XX:+AlwaysPreTouch -XX:+UnlockExperimentalVMOptions -XX:+TrustFinalNonStaticFields -XX:+DisableExplicitGC -Djdk.tls.ephemeralDHKeySize=2048 -Djdk.tls.rejectClientInitiatedRenegotiation=true -Dunsupported.dbms.udc.source=amazon-ami-SINGLE -Dfile.encoding=UTF-8 org.neo4j.server.CommunityEntryPoint --home-dir=/var/lib/neo4j --config-dir=/etc/neo4j

# ps aux | grep neo4j
# sudo rm $NEO4J_HOME/plugins/neo4j-graph-data-science-1.6.2.jar
# sudo rm $NEO4J_HOME/plugins/neosemantics-*
# sudo kill -9 26289
# sudo kill -9 26290