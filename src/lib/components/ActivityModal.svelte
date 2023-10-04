<script lang="ts">
	import Activity from "./Activity.svelte";

    export let show = false;;
    let bg: HTMLButtonElement;
    type Acitvity = {
        name: string,
        leader: string,
        location: string,
        signups: number,
        capacity: number,
        type: string,

    }
    let acitivtyList: Array<Acitvity> = [
        {name: "Study Block", leader: "Manlunes", location: "Room 123", signups: 5, capacity: 20, type: "torture"},
        {name: "Movie Day", leader: "Tristan", location: "Room 301", signups: 20, capacity: 20, type: "fun"},
        {name: "Game Fun Time", leader: "Will", location: "Room 121", signups: 29, capacity: 30, type: "fun"}
    ]
    let closeModal = (e: MouseEvent) => {
        if(e.target == bg) {
            show = false;
        }
    }
</script>

{#if show}
    <button class="wrap" on:click={closeModal} bind:this={bg}>
        
        <div class="activityList">
            <input placeholder="search" class="search"/>
            {#each acitivtyList as activityItem}
                <div class="activity">
                    <h2>{activityItem.name} - {activityItem.leader}</h2>
                    <div class="quickDetails">
                        <div class="detailRow">
                            <img src="/icons/location.svg" alt="location" />
                            {activityItem.location}
                        </div>
                        <div class="detailRow">
                            <img src="/icons/group.svg" alt="location" />
                            {activityItem.signups}/{activityItem.capacity}
                        </div>
                        <div class="detailRow">
                            <img src="/icons/activity.svg" alt="location" />
                            {activityItem.type}
                        </div>
                        
                    </div>
                </div>
            {/each}
        </div>
    </button>
{/if}

<style>
    .wrap {
        all: unset;
        background: rgba(0, 0, 0, 0.5);
        backdrop-filter: blur(10px);
        width: 100%;
        height: 100vh;
        position: fixed;
        z-index: 20;
        display: flex;
        align-items: start;
        justify-content: center;
    }
    .activityList {
        margin-top: 25px;
        width: 90%;
        max-width: 600px;
        padding: 5px;
        background: #cfcfcf;
        box-sizing: border-box;
        border-radius: 5px;
    }
    .activity {
        width: 100%;
        padding: 10px 20px;
        box-sizing: border-box;
        background: var(--bg);
        display: flex;
        flex-direction: column;
        border-top: 1px solid var(--blue);
    }
    .activity h2 {
        margin: 0px 0px 5px 0px
    }
    .detailRow {
        display: flex;
        flex-direction: row;
        margin-right: 30px;
        color: var(--textDark);
    }
    .detailRow img {
        margin-right: 5px;
        opacity: 0.7;
    }
    .quickDetails {
        display: flex;
        flex-direction: row;
    }
    .search {
        all: unset;
        width: 100%;
        padding: 10px 20px;
        box-sizing: border-box;
        background: var(--bg);
        display: flex;
        border-radius: 5px;
        flex-direction: column;
        transition: all cubic-bezier(0.075, 0.82, 0.165, 1) 0.2s;
    }
    .search:hover {
        background: rgba(0, 0, 0, 0.1);
        transition: all cubic-bezier(0.075, 0.82, 0.165, 1) 0.2s;
    }
</style>