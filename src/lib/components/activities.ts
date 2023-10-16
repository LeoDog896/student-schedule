export type Activity = {
	name: string;
	leader: string;
	location: string;
	signups: number;
	capacity: number;
	type: string;
};

export function fetchActivities(): Activity[] {
	const activities: Activity[] = [
		{
			name: 'Study Block',
			leader: 'Manlunas',
			location: 'Room 123',
			signups: 5,
			capacity: 20,
			type: 'Study'
		},
		{
			name: 'Movie Day',
			leader: 'Tristan',
			location: 'Room 301',
			signups: 20,
			capacity: 20,
			type: 'Fun'
		},
		{
			name: 'Game Fun Time',
			leader: 'Will',
			location: 'Room 121',
			signups: 29,
			capacity: 30,
			type: 'Fun'
		},
		{
			name: "Dylan's Study Block",
			leader: 'Dylan Myers',
			location: 'Room 123',
			signups: 17,
			capacity: 20,
			type: 'Tutoring'
		}
	];

	return activities;
}
