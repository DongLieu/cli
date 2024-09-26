package chaintest_test

import (
	"testing"

	"github.com/stretchr/testify/require"
	keepertest "github.com/test/chaintest/testutil/keeper"
	"github.com/test/chaintest/testutil/nullify"
	chaintest "github.com/test/chaintest/x/chaintest/module"
	"github.com/test/chaintest/x/chaintest/types"
)

func TestGenesis(t *testing.T) {
	genesisState := types.GenesisState{
		Params: types.DefaultParams(),

		// this line is used by starport scaffolding # genesis/test/state
	}

	k, ctx, _ := keepertest.ChaintestKeeper(t)
	err := chaintest.InitGenesis(ctx, k, genesisState)
	require.NoError(t, err)
	got, err := chaintest.ExportGenesis(ctx, k)
	require.NoError(t, err)
	require.NotNil(t, got)

	nullify.Fill(&genesisState)
	nullify.Fill(got)

	// this line is used by starport scaffolding # genesis/test/assert
}
