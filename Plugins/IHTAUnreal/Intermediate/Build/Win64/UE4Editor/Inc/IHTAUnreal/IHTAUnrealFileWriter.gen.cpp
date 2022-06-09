// Copyright Epic Games, Inc. All Rights Reserved.
/*===========================================================================
	Generated code exported from UnrealHeaderTool.
	DO NOT modify this manually! Edit the corresponding .h files instead!
===========================================================================*/

#include "UObject/GeneratedCppIncludes.h"
#include "IHTAUnreal/Public/IHTAUnrealFileWriter.h"
#ifdef _MSC_VER
#pragma warning (push)
#pragma warning (disable : 4883)
#endif
PRAGMA_DISABLE_DEPRECATION_WARNINGS
void EmptyLinkFunctionForGeneratedCodeIHTAUnrealFileWriter() {}
// Cross Module References
	IHTAUNREAL_API UClass* Z_Construct_UClass_UIHTAUnrealFileWriter_NoRegister();
	IHTAUNREAL_API UClass* Z_Construct_UClass_UIHTAUnrealFileWriter();
	ENGINE_API UClass* Z_Construct_UClass_UBlueprintFunctionLibrary();
	UPackage* Z_Construct_UPackage__Script_IHTAUnreal();
	COREUOBJECT_API UScriptStruct* Z_Construct_UScriptStruct_FRotator();
	COREUOBJECT_API UScriptStruct* Z_Construct_UScriptStruct_FVector();
// End Cross Module References
	DEFINE_FUNCTION(UIHTAUnrealFileWriter::execshuffleArray)
	{
		P_GET_TARRAY(FName,Z_Param_Array);
		P_FINISH;
		P_NATIVE_BEGIN;
		*(TArray<FName>*)Z_Param__Result=UIHTAUnrealFileWriter::shuffleArray(Z_Param_Array);
		P_NATIVE_END;
	}
	DEFINE_FUNCTION(UIHTAUnrealFileWriter::execwriteToFile)
	{
		P_GET_TARRAY(FRotator,Z_Param_rotations);
		P_GET_TARRAY(FVector,Z_Param_positions);
		P_GET_PROPERTY(FStrProperty,Z_Param_fileName);
		P_FINISH;
		P_NATIVE_BEGIN;
		*(bool*)Z_Param__Result=UIHTAUnrealFileWriter::writeToFile(Z_Param_rotations,Z_Param_positions,Z_Param_fileName);
		P_NATIVE_END;
	}
	void UIHTAUnrealFileWriter::StaticRegisterNativesUIHTAUnrealFileWriter()
	{
		UClass* Class = UIHTAUnrealFileWriter::StaticClass();
		static const FNameNativePtrPair Funcs[] = {
			{ "shuffleArray", &UIHTAUnrealFileWriter::execshuffleArray },
			{ "writeToFile", &UIHTAUnrealFileWriter::execwriteToFile },
		};
		FNativeFunctionRegistrar::RegisterFunctions(Class, Funcs, UE_ARRAY_COUNT(Funcs));
	}
	struct Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics
	{
		struct IHTAUnrealFileWriter_eventshuffleArray_Parms
		{
			TArray<FName> Array;
			TArray<FName> ReturnValue;
		};
		static const UE4CodeGen_Private::FNamePropertyParams NewProp_Array_Inner;
		static const UE4CodeGen_Private::FArrayPropertyParams NewProp_Array;
		static const UE4CodeGen_Private::FNamePropertyParams NewProp_ReturnValue_Inner;
		static const UE4CodeGen_Private::FArrayPropertyParams NewProp_ReturnValue;
		static const UE4CodeGen_Private::FPropertyParamsBase* const PropPointers[];
#if WITH_METADATA
		static const UE4CodeGen_Private::FMetaDataPairParam Function_MetaDataParams[];
#endif
		static const UE4CodeGen_Private::FFunctionParams FuncParams;
	};
	const UE4CodeGen_Private::FNamePropertyParams Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics::NewProp_Array_Inner = { "Array", nullptr, (EPropertyFlags)0x0000000000000000, UE4CodeGen_Private::EPropertyGenFlags::Name, RF_Public|RF_Transient|RF_MarkAsNative, 1, 0, METADATA_PARAMS(nullptr, 0) };
	const UE4CodeGen_Private::FArrayPropertyParams Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics::NewProp_Array = { "Array", nullptr, (EPropertyFlags)0x0010000000000080, UE4CodeGen_Private::EPropertyGenFlags::Array, RF_Public|RF_Transient|RF_MarkAsNative, 1, STRUCT_OFFSET(IHTAUnrealFileWriter_eventshuffleArray_Parms, Array), EArrayPropertyFlags::None, METADATA_PARAMS(nullptr, 0) };
	const UE4CodeGen_Private::FNamePropertyParams Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics::NewProp_ReturnValue_Inner = { "ReturnValue", nullptr, (EPropertyFlags)0x0000000000000000, UE4CodeGen_Private::EPropertyGenFlags::Name, RF_Public|RF_Transient|RF_MarkAsNative, 1, 0, METADATA_PARAMS(nullptr, 0) };
	const UE4CodeGen_Private::FArrayPropertyParams Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics::NewProp_ReturnValue = { "ReturnValue", nullptr, (EPropertyFlags)0x0010000000000580, UE4CodeGen_Private::EPropertyGenFlags::Array, RF_Public|RF_Transient|RF_MarkAsNative, 1, STRUCT_OFFSET(IHTAUnrealFileWriter_eventshuffleArray_Parms, ReturnValue), EArrayPropertyFlags::None, METADATA_PARAMS(nullptr, 0) };
	const UE4CodeGen_Private::FPropertyParamsBase* const Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics::PropPointers[] = {
		(const UE4CodeGen_Private::FPropertyParamsBase*)&Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics::NewProp_Array_Inner,
		(const UE4CodeGen_Private::FPropertyParamsBase*)&Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics::NewProp_Array,
		(const UE4CodeGen_Private::FPropertyParamsBase*)&Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics::NewProp_ReturnValue_Inner,
		(const UE4CodeGen_Private::FPropertyParamsBase*)&Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics::NewProp_ReturnValue,
	};
#if WITH_METADATA
	const UE4CodeGen_Private::FMetaDataPairParam Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics::Function_MetaDataParams[] = {
		{ "Category", "IHRAUnreal" },
		{ "ModuleRelativePath", "Public/IHTAUnrealFileWriter.h" },
	};
#endif
	const UE4CodeGen_Private::FFunctionParams Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics::FuncParams = { (UObject*(*)())Z_Construct_UClass_UIHTAUnrealFileWriter, nullptr, "shuffleArray", nullptr, nullptr, sizeof(IHTAUnrealFileWriter_eventshuffleArray_Parms), Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics::PropPointers, UE_ARRAY_COUNT(Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics::PropPointers), RF_Public|RF_Transient|RF_MarkAsNative, (EFunctionFlags)0x04022401, 0, 0, METADATA_PARAMS(Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics::Function_MetaDataParams, UE_ARRAY_COUNT(Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics::Function_MetaDataParams)) };
	UFunction* Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray()
	{
		static UFunction* ReturnFunction = nullptr;
		if (!ReturnFunction)
		{
			UE4CodeGen_Private::ConstructUFunction(ReturnFunction, Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray_Statics::FuncParams);
		}
		return ReturnFunction;
	}
	struct Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics
	{
		struct IHTAUnrealFileWriter_eventwriteToFile_Parms
		{
			TArray<FRotator> rotations;
			TArray<FVector> positions;
			FString fileName;
			bool ReturnValue;
		};
		static const UE4CodeGen_Private::FStructPropertyParams NewProp_rotations_Inner;
		static const UE4CodeGen_Private::FArrayPropertyParams NewProp_rotations;
		static const UE4CodeGen_Private::FStructPropertyParams NewProp_positions_Inner;
		static const UE4CodeGen_Private::FArrayPropertyParams NewProp_positions;
		static const UE4CodeGen_Private::FStrPropertyParams NewProp_fileName;
		static void NewProp_ReturnValue_SetBit(void* Obj);
		static const UE4CodeGen_Private::FBoolPropertyParams NewProp_ReturnValue;
		static const UE4CodeGen_Private::FPropertyParamsBase* const PropPointers[];
#if WITH_METADATA
		static const UE4CodeGen_Private::FMetaDataPairParam Function_MetaDataParams[];
#endif
		static const UE4CodeGen_Private::FFunctionParams FuncParams;
	};
	const UE4CodeGen_Private::FStructPropertyParams Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::NewProp_rotations_Inner = { "rotations", nullptr, (EPropertyFlags)0x0000000000000000, UE4CodeGen_Private::EPropertyGenFlags::Struct, RF_Public|RF_Transient|RF_MarkAsNative, 1, 0, Z_Construct_UScriptStruct_FRotator, METADATA_PARAMS(nullptr, 0) };
	const UE4CodeGen_Private::FArrayPropertyParams Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::NewProp_rotations = { "rotations", nullptr, (EPropertyFlags)0x0010000000000080, UE4CodeGen_Private::EPropertyGenFlags::Array, RF_Public|RF_Transient|RF_MarkAsNative, 1, STRUCT_OFFSET(IHTAUnrealFileWriter_eventwriteToFile_Parms, rotations), EArrayPropertyFlags::None, METADATA_PARAMS(nullptr, 0) };
	const UE4CodeGen_Private::FStructPropertyParams Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::NewProp_positions_Inner = { "positions", nullptr, (EPropertyFlags)0x0000000000000000, UE4CodeGen_Private::EPropertyGenFlags::Struct, RF_Public|RF_Transient|RF_MarkAsNative, 1, 0, Z_Construct_UScriptStruct_FVector, METADATA_PARAMS(nullptr, 0) };
	const UE4CodeGen_Private::FArrayPropertyParams Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::NewProp_positions = { "positions", nullptr, (EPropertyFlags)0x0010000000000080, UE4CodeGen_Private::EPropertyGenFlags::Array, RF_Public|RF_Transient|RF_MarkAsNative, 1, STRUCT_OFFSET(IHTAUnrealFileWriter_eventwriteToFile_Parms, positions), EArrayPropertyFlags::None, METADATA_PARAMS(nullptr, 0) };
	const UE4CodeGen_Private::FStrPropertyParams Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::NewProp_fileName = { "fileName", nullptr, (EPropertyFlags)0x0010000000000080, UE4CodeGen_Private::EPropertyGenFlags::Str, RF_Public|RF_Transient|RF_MarkAsNative, 1, STRUCT_OFFSET(IHTAUnrealFileWriter_eventwriteToFile_Parms, fileName), METADATA_PARAMS(nullptr, 0) };
	void Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::NewProp_ReturnValue_SetBit(void* Obj)
	{
		((IHTAUnrealFileWriter_eventwriteToFile_Parms*)Obj)->ReturnValue = 1;
	}
	const UE4CodeGen_Private::FBoolPropertyParams Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::NewProp_ReturnValue = { "ReturnValue", nullptr, (EPropertyFlags)0x0010000000000580, UE4CodeGen_Private::EPropertyGenFlags::Bool | UE4CodeGen_Private::EPropertyGenFlags::NativeBool, RF_Public|RF_Transient|RF_MarkAsNative, 1, sizeof(bool), sizeof(IHTAUnrealFileWriter_eventwriteToFile_Parms), &Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::NewProp_ReturnValue_SetBit, METADATA_PARAMS(nullptr, 0) };
	const UE4CodeGen_Private::FPropertyParamsBase* const Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::PropPointers[] = {
		(const UE4CodeGen_Private::FPropertyParamsBase*)&Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::NewProp_rotations_Inner,
		(const UE4CodeGen_Private::FPropertyParamsBase*)&Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::NewProp_rotations,
		(const UE4CodeGen_Private::FPropertyParamsBase*)&Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::NewProp_positions_Inner,
		(const UE4CodeGen_Private::FPropertyParamsBase*)&Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::NewProp_positions,
		(const UE4CodeGen_Private::FPropertyParamsBase*)&Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::NewProp_fileName,
		(const UE4CodeGen_Private::FPropertyParamsBase*)&Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::NewProp_ReturnValue,
	};
#if WITH_METADATA
	const UE4CodeGen_Private::FMetaDataPairParam Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::Function_MetaDataParams[] = {
		{ "Category", "IHTAUnreal" },
		{ "Comment", "//saves collected data from HMD tracking to a file\n" },
		{ "ModuleRelativePath", "Public/IHTAUnrealFileWriter.h" },
		{ "ToolTip", "saves collected data from HMD tracking to a file" },
	};
#endif
	const UE4CodeGen_Private::FFunctionParams Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::FuncParams = { (UObject*(*)())Z_Construct_UClass_UIHTAUnrealFileWriter, nullptr, "writeToFile", nullptr, nullptr, sizeof(IHTAUnrealFileWriter_eventwriteToFile_Parms), Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::PropPointers, UE_ARRAY_COUNT(Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::PropPointers), RF_Public|RF_Transient|RF_MarkAsNative, (EFunctionFlags)0x04022401, 0, 0, METADATA_PARAMS(Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::Function_MetaDataParams, UE_ARRAY_COUNT(Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::Function_MetaDataParams)) };
	UFunction* Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile()
	{
		static UFunction* ReturnFunction = nullptr;
		if (!ReturnFunction)
		{
			UE4CodeGen_Private::ConstructUFunction(ReturnFunction, Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile_Statics::FuncParams);
		}
		return ReturnFunction;
	}
	UClass* Z_Construct_UClass_UIHTAUnrealFileWriter_NoRegister()
	{
		return UIHTAUnrealFileWriter::StaticClass();
	}
	struct Z_Construct_UClass_UIHTAUnrealFileWriter_Statics
	{
		static UObject* (*const DependentSingletons[])();
		static const FClassFunctionLinkInfo FuncInfo[];
#if WITH_METADATA
		static const UE4CodeGen_Private::FMetaDataPairParam Class_MetaDataParams[];
#endif
		static const FCppClassTypeInfoStatic StaticCppClassTypeInfo;
		static const UE4CodeGen_Private::FClassParams ClassParams;
	};
	UObject* (*const Z_Construct_UClass_UIHTAUnrealFileWriter_Statics::DependentSingletons[])() = {
		(UObject* (*)())Z_Construct_UClass_UBlueprintFunctionLibrary,
		(UObject* (*)())Z_Construct_UPackage__Script_IHTAUnreal,
	};
	const FClassFunctionLinkInfo Z_Construct_UClass_UIHTAUnrealFileWriter_Statics::FuncInfo[] = {
		{ &Z_Construct_UFunction_UIHTAUnrealFileWriter_shuffleArray, "shuffleArray" }, // 3139176032
		{ &Z_Construct_UFunction_UIHTAUnrealFileWriter_writeToFile, "writeToFile" }, // 1186087616
	};
#if WITH_METADATA
	const UE4CodeGen_Private::FMetaDataPairParam Z_Construct_UClass_UIHTAUnrealFileWriter_Statics::Class_MetaDataParams[] = {
		{ "Comment", "/**\n * \n */" },
		{ "IncludePath", "IHTAUnrealFileWriter.h" },
		{ "ModuleRelativePath", "Public/IHTAUnrealFileWriter.h" },
	};
#endif
	const FCppClassTypeInfoStatic Z_Construct_UClass_UIHTAUnrealFileWriter_Statics::StaticCppClassTypeInfo = {
		TCppClassTypeTraits<UIHTAUnrealFileWriter>::IsAbstract,
	};
	const UE4CodeGen_Private::FClassParams Z_Construct_UClass_UIHTAUnrealFileWriter_Statics::ClassParams = {
		&UIHTAUnrealFileWriter::StaticClass,
		nullptr,
		&StaticCppClassTypeInfo,
		DependentSingletons,
		FuncInfo,
		nullptr,
		nullptr,
		UE_ARRAY_COUNT(DependentSingletons),
		UE_ARRAY_COUNT(FuncInfo),
		0,
		0,
		0x001000A0u,
		METADATA_PARAMS(Z_Construct_UClass_UIHTAUnrealFileWriter_Statics::Class_MetaDataParams, UE_ARRAY_COUNT(Z_Construct_UClass_UIHTAUnrealFileWriter_Statics::Class_MetaDataParams))
	};
	UClass* Z_Construct_UClass_UIHTAUnrealFileWriter()
	{
		static UClass* OuterClass = nullptr;
		if (!OuterClass)
		{
			UE4CodeGen_Private::ConstructUClass(OuterClass, Z_Construct_UClass_UIHTAUnrealFileWriter_Statics::ClassParams);
		}
		return OuterClass;
	}
	IMPLEMENT_CLASS(UIHTAUnrealFileWriter, 480957556);
	template<> IHTAUNREAL_API UClass* StaticClass<UIHTAUnrealFileWriter>()
	{
		return UIHTAUnrealFileWriter::StaticClass();
	}
	static FCompiledInDefer Z_CompiledInDefer_UClass_UIHTAUnrealFileWriter(Z_Construct_UClass_UIHTAUnrealFileWriter, &UIHTAUnrealFileWriter::StaticClass, TEXT("/Script/IHTAUnreal"), TEXT("UIHTAUnrealFileWriter"), false, nullptr, nullptr, nullptr);
	DEFINE_VTABLE_PTR_HELPER_CTOR(UIHTAUnrealFileWriter);
PRAGMA_ENABLE_DEPRECATION_WARNINGS
#ifdef _MSC_VER
#pragma warning (pop)
#endif
