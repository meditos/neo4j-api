aws ec2 run-instances \
--image-id ami-0fd30323278ca5f7a \
--count 1 \
--instance-type m4.large \
--key-name neo4j_act \
--security-group-ids sg-170e756a \
--subnet-id subnet-6cd70820

