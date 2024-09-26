package types

import "cosmossdk.io/collections"

const (
	// ModuleName defines the module name
	ModuleName = "chaintest"

	// StoreKey defines the primary module store key
	StoreKey = ModuleName

	// MemStoreKey defines the in-memory store key
	MemStoreKey = "mem_chaintest"
)

// ParamsKey is the prefix to retrieve all Params
var ParamsKey = collections.NewPrefix("p_chaintest")
