<?php

namespace App\Http\Resources;
use App\Http\Resources\BidderResource;
use App\Http\Resources\VehicleResource;
use Illuminate\Http\Resources\Json\JsonResource;

class clientResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'    =>$this->id,
            'name'=>$this->name,
            'email'=>$this->email,
            'phone'=>$this->phone,
            'address'=>$this->address,
            
        ];
    }
}