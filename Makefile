
run: clean prepare runA runB runC

prepare:
	mkdir -p /tmp/my-raft-cluster/{nodeA,nodeB,nodeC}

clean:
	rm -rf /tmp/my-raft-cluster/

runA:
	go run main.go --raft_id=nodeA --address=localhost:50051 --redis_address=localhost:63791 --raft_data_dir /tmp/my-raft-cluster --initial_peers nodeB=localhost:50052,nodeC=localhost:50053
runB:
	go run main.go --raft_id=nodeB --address=localhost:50052 --redis_address=localhost:63792 --raft_data_dir /tmp/my-raft-cluster --initial_peers nodeA=localhost:50051,nodeC=localhost:50053
runC:
	go run main.go --raft_id=nodeC --address=localhost:50053 --redis_address=localhost:63793 --raft_data_dir /tmp/my-raft-cluster --initial_peers nodeA=localhost:50051,nodeB=localhost:50052


