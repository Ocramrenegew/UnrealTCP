// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Kismet/BlueprintFunctionLibrary.h"
#include "IHTAUnrealFileWriter.generated.h"




/**
 * 
 */
UCLASS()
class IHTAUNREAL_API UIHTAUnrealFileWriter : public UBlueprintFunctionLibrary
{
	GENERATED_BODY()

public:
	//saves collected data from HMD tracking to a file
	UFUNCTION(BlueprintCallable, Category="IHTAUnreal")
	static bool writeToFile(TArray<FRotator> rotations, TArray<FVector> positions, FString fileName);

	UFUNCTION(BlueprintCallable, Category = "IHRAUnreal")
	static TArray<FName> shuffleArray(TArray<FName> Array);
};
