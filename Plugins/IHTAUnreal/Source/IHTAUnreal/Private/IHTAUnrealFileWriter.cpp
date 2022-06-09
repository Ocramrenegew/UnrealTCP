// Fill out your copyright notice in the Description page of Project Settings.


#include "IHTAUnrealFileWriter.h"

bool UIHTAUnrealFileWriter::writeToFile(TArray<FRotator> rotations, TArray<FVector> positions, FString fileName)
{
	IPlatformFile& FileManager = FPlatformFileManager::Get().GetPlatformFile();
	TArray<FString> stringData = TArray<FString>();

	//check array sizes
	if (rotations.Num() != positions.Num())
	{
		UE_LOG(LogTemp, Warning, TEXT("Arrays must be same size!"));
		return false;
	}

	//combine into single array
	for (int32 i = 0; i < rotations.Num(); i++)
	{
		stringData.Add(rotations[i].ToString() + TEXT(" ") + positions[i].ToString());
	}

	//write to file
	if (!FileManager.FileExists(*fileName))
	{
		UE_LOG(LogTemp, Warning, TEXT("File does not exist!"));
		return false;
	}

	if (FFileHelper::SaveStringArrayToFile(stringData, *fileName, FFileHelper::EEncodingOptions::AutoDetect, &IFileManager::Get(),
		EFileWrite::FILEWRITE_Append))
	{
		UE_LOG(LogTemp, Warning, TEXT("File successfully written."));
		return true;
	}
	else
	{
		UE_LOG(LogTemp, Warning, TEXT("Failed to write file."));
		return false;
	}
}

TArray<FName> UIHTAUnrealFileWriter::shuffleArray(TArray<FName> Array)
{
	if (Array.Num() > 0)
	{
		for (int32 i = 0; i <= Array.Num() - 1; i++)
		{
			int32 rIndex = FMath::RandRange(i, Array.Num() - 1);
			if (i != rIndex)
			{
				Array.Swap(i, rIndex);
			}
		}
	}
	return Array;
}