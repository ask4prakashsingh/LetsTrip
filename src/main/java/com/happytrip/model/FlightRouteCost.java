package com.happytrip.model;

import java.io.Serializable;
import java.util.Comparator;


/**
 * The persistent class for the flightroutecosts database table.
 * 
 */
public class FlightRouteCost implements Serializable,Comparable<FlightRouteCost> {
	private static final long serialVersionUID = 1L;

	private long flightRouteCostId;

	private float costPerTicket;

	//bi-directional many-to-one association to Class
	private FlightClass flightClass;

	//bi-directional many-to-one association to Flightroute
	private FlightRoute flightRoute;

    public FlightRouteCost() {
    }

	public long getFlightRouteCostId() {
		return this.flightRouteCostId;
	}

	public void setFlightRouteCostId(long flightRouteCostId) {
		this.flightRouteCostId = flightRouteCostId;
	}

	public float getCostPerTicket() {
		return this.costPerTicket;
	}

	public void setCostPerTicket(float costPerTicket) {
		this.costPerTicket = costPerTicket;
	}

	public FlightClass getFlightClass() {
		return this.flightClass;
	}

	public void setFlightClass(FlightClass classId) {
		this.flightClass = classId;
	}
	
	public FlightRoute getFlightRoute() {
		return this.flightRoute;
	}

	public void setFlightRoute(FlightRoute flightroute) {
		this.flightRoute = flightroute;
	}

/*	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Float.floatToIntBits(costPerTicket);
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FlightRouteCost other = (FlightRouteCost) obj;
		if (Float.floatToIntBits(costPerTicket) != Float
				.floatToIntBits(other.costPerTicket))
			return false;
		return true;
	}*/

	@Override
	public int compareTo(FlightRouteCost o) {
		if(this.costPerTicket>o.costPerTicket)
			return 1;
		else if(this.costPerTicket<o.costPerTicket)
			return -1;
		else
			return 0;
	}
	
	
}